import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/interfaces/NotifyUserPayment.dart';
import 'package:retail_store_management_system/interfaces/NotifyUserSuccess.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';
import 'package:retail_store_management_system/models/takeOrderModel.dart';
import 'package:retail_store_management_system/operations/Collection.dart';
import 'package:retail_store_management_system/operations/OrderOperation.dart';

class ShopCartDashboard extends StatefulWidget {
  final List<OrderModel>? newPurchaes;
  const ShopCartDashboard(
      {Key? key, required this.newPurchaes, required this.newTakeOrder})
      : super(key: key);

  final List<takeOrderModel>? newTakeOrder;

  @override
  _ShopCartDashboard createState() => _ShopCartDashboard();
}

class _ShopCartDashboard extends State<ShopCartDashboard> {
  var _sortAscending = true;
  var order = OrderOperation();
  int orderNumber = 0;
  String state = 'Order';
  String status = 'WALKIN';

  int randomNumber() {
    Random random = new Random();
    var randomNumber = random.nextInt(100);

    return randomNumber;
  }

  @override
  void initState() {
    order.getOrderNumber().then((value) {
      setState(() {
        value++;
      });
      orderNumber = value;
    });
    //step 2

    super.initState();
  }

// Getting the total price
  double getTotalPrice() {
    double totalPrice = 0;

    widget.newPurchaes?.forEach((element) {
      totalPrice += element.getProductPrice * element.getProductQuantity;
    });

    return totalPrice;
  }

//Output all of the added item in cart
  Widget build(BuildContext context) {
    final checkOut = TextEditingController();
    final payment = TextEditingController();

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 5, right: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Order Number: $orderNumber',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#155293"),
              fontFamily: 'Cairo_Bold',
              fontSize: 15,
              overflow: TextOverflow.fade,
            ),
            maxLines: 2,
          ),
        ),
        Container(
          child: Container(
            width: (MediaQuery.of(context).size.width) / 1.5,
            height: (MediaQuery.of(context).size.height) / 2,
            child: PaginatedDataTable(
              showCheckboxColumn: false,
              showFirstLastButtons: true,
              sortAscending: _sortAscending,
              sortColumnIndex: 1,
              rowsPerPage: 5,
              columns: [
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Size')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Staff')),
              ],
              source: _DataSource(context, widget.newPurchaes!.toList()),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Total Price' + getTotalPrice().toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#155293"),
              fontFamily: 'Cairo_Bold',
              fontSize: 30,
              overflow: TextOverflow.fade,
            ),
            maxLines: 2,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Container(
            width: 500,
            child: TextField(
              controller: payment,
              decoration: InputDecoration(
                labelText: 'Payment',
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 18,
              left: 50,
              right: 50,
            ),
            primary: Colors.black,
            textStyle: TextStyle(
              fontFamily: 'Cairo_SemiBold',
              fontSize: 20,
            ),
          ),
          child: const Text('CHECKOUT'),
          onPressed: () {
            if (getTotalPrice() < int.parse(payment.text)) {
              //will add the orders to the database
              order
                  .sendOrders(Collection.dateToday(), orderNumber, payment.text,
                      randomNumber().toString(), state, status)
                  .then((value) => print('ORDER HAS BEEN ADDED'));

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      children: [
                        Container(
                          width: 410,
                          height: 130,
                          child: NotifyUserSuccess(),
                        ),
                      ],
                    );
                  });

              return;
            }

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    children: [
                      Container(
                        width: 410,
                        height: 130,
                        child: NotifyUserPayment(),
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueProductName,
    this.valuePrice,
    this.valueSize,
    this.valueQuantity,
    this.valueDate,
    this.valueStatus,
    this.valueStaff,
  );

  final String valueProductName;
  final String valuePrice;
  final String valueSize;
  final String valueQuantity;
  final String valueDate;
  final String? valueStatus;
  final String? valueStaff;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, newPurchaes) {
    purchases = newPurchaes;
    _paymentsList(purchases);
  }

  List<OrderModel> purchases = [];

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsList(purchases).length) return null;
    final row = _paymentsList(purchases)[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          var value = false;
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueProductName)),
        DataCell(Text(row.valuePrice)),
        DataCell(Text(row.valueSize)),
        DataCell(Text(row.valueQuantity)),
        DataCell(Text(row.valueDate)),
        DataCell(Text(row.valueStatus.toString())),
        DataCell(Text(row.valueStaff.toString())),
      ],
    );
  }

  @override
  int get rowCount => _paymentsList(purchases).length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _paymentsList(List<OrderModel> purchases) {
  try {
    return List.generate(
      purchases.length,
      (index) {
        return _Row(
          purchases[index].getProductName.toString(),
          purchases[index].getProductPrice.toString(),
          purchases[index].getProductSize.toString(),
          purchases[index].productQuantity.toString(),
          purchases[index].getDateToday.toString(),
          purchases[index].getStatus.toString(),
          purchases[index].getstaff.toString(),
        );
      },
    );
  } catch (e) {
    //if borrowers list is empty
    return List.generate(0, (index) {
      return _Row(
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      );
    });
  }
}
