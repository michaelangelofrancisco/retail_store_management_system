import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/models/DataOrderModel.dart';
import 'package:retail_store_management_system/models/OrderHistoryModel.dart';
import 'package:retail_store_management_system/operations/Collector.dart';
import 'package:retail_store_management_system/operations/InventoryOperation.dart';
import 'package:retail_store_management_system/operations/SalesOperation.dart';

//Sales Order History Interface
class OrderHistory extends StatefulWidget {
  final int? id;
  OrderHistory({required this.id});

  @override
  _OrderHistory createState() => _OrderHistory();
}

class _OrderHistory extends State<OrderHistory> {
  var history = SalesOperation();
  var details = InventoryOperation();
  late Future<List<OrderHistoryModel>> getDetails;
  late Future<List<DataOrderModel>> _orderHistory;
  String? name1;
  String? address1;
  String? number1;
  String? payment1;
  double? price1;

  @override
  void initState() {
    super.initState();
    print("id ${widget.id.toString()}");
    _orderHistory =
        history.getOrderInformation(int.parse(widget.id!.toString()));

    getDetails = details.fetchDetails(int.parse(widget.id.toString()));

    //Getting the Details of a customer from database
    getDetails.whenComplete(() {
      setState(() {
        name1 = customerDetailsName();
        address1 = customerDetailsAddress();
        number1 = customerDetailsNumber();
        payment1 = customerDetailsPayment();
        price1 = customerDetailsTotalPrice();
      });
    });
  }

  //Getting the Name from Database
  String customerDetailsName() {
    String name = "";
    Collector.getCustomerDetails
        .where((element) =>
            element.getOrderNumber == int.parse(widget.id.toString()))
        .forEach((element) {
      name = "${element.firstname} ${element.lastname}";
    });

    return name;
  }

  String customerDetailsAddress() {
    String address = "";
    Collector.getCustomerDetails
        .where((element) =>
            element.getOrderNumber == int.parse(widget.id.toString()))
        .forEach((element) {
      address = "${element.address}";
    });

    return address;
  }

  String customerDetailsNumber() {
    String number = "";
    Collector.getCustomerDetails
        .where((element) =>
            element.getOrderNumber == int.parse(widget.id.toString()))
        .forEach((element) {
      number = "${element.number}";
    });

    return number;
  }

  String customerDetailsPayment() {
    String payment = "";
    Collector.getCustomerDetails
        .where((element) =>
            element.getOrderNumber == int.parse(widget.id.toString()))
        .forEach((element) {
      payment = "${element.payment}";
    });

    return payment;
  }

  double customerDetailsTotalPrice() {
    double temp = 0;
    String price = "";
    Collector.getCustomerDetails
        .where((element) =>
            element.getOrderNumber == int.parse(widget.id.toString()))
        .forEach((element) {
      temp += element.price!.toDouble();
    });

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.height),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Customer Name: $name1',
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Address: $address1',
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Contact Number: $number1',
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Payment: $payment1',
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Total Price: $price1',
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
          ),
          Text(
            'Order History',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#155293"),
              fontFamily: 'Cairo_Bold',
              fontSize: 30,
            ),
          ),
          FutureBuilder<List<DataOrderModel>>(
            future: _orderHistory,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                    child: PaginatedDataTable(
                      showCheckboxColumn: false,
                      showFirstLastButtons: true,
                      sortColumnIndex: 0,
                      rowsPerPage: 12,
                      columns: [
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Size')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Staff')),
                      ],
                      source: _DataSource(context, snapshot.data!.toList()),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'NO Order HISTORY',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Cairo_SemiBold',
                          fontSize: 20),
                    ),
                  );
                }
              }
              return Center(
                child: Center(
                  child: Text(
                    'NO PAYMENT HISTORY FOR THIS BORROWER',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'Cairo_SemiBold',
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Row {
  _Row(
    this.productName,
    this.price,
    this.size,
    this.quantity,
    this.status,
    this.date,
    this.staff,
  );

  final String productName;
  final String price;
  final String size;
  final String quantity;
  final String status;
  final String date;
  final String staff;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this._orderHistory) {
    _orderHistory = _orderHistory;
    _payHistory = _paymentsHistory(_orderHistory);
  }

  final BuildContext context;

  int _selectedCount = 0;
  List<_Row> _payHistory = [];
  List<DataOrderModel> _orderHistory = [];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _payHistory.length) return null;
    final row = _payHistory[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      cells: [
        DataCell(Text(row.productName)),
        DataCell(Text(row.price)),
        DataCell(Text(row.size)),
        DataCell(Text(row.quantity)),
        DataCell(Text(row.status)),
        DataCell(Text(row.date)),
        DataCell(Text(row.staff)),
      ],
    );
  }

  @override
  int get rowCount => _payHistory.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  List<_Row> _paymentsHistory(List<DataOrderModel> orderHistory) {
    try {
      return List.generate(
        orderHistory.length,
        (index) {
          return _Row(
            orderHistory[index].getProductName.toString(),
            orderHistory[index].getPrice.toString(),
            orderHistory[index].getSize.toString(),
            orderHistory[index].getQuantity.toString(),
            orderHistory[index].getStatus.toString(),
            orderHistory[index].getDateOfPurchased.toString(),
            orderHistory[index].getStaff.toString(),
          );
        },
      );
    } catch (e) {
      return List.generate(
        0,
        (index) {
          return _Row(
            '',
            '',
            '',
            '',
            '',
            '',
            '',
          );
        },
      );
    }
  }
}
