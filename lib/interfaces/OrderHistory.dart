import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:retail_store_management_system/models/DataOrderModel.dart';
import 'package:retail_store_management_system/operations/SalesOperation.dart';

class OrderHistory extends StatefulWidget {
  final int? id;
  OrderHistory({required this.id});

  @override
  _OrderHistory createState() => _OrderHistory();
}

class _OrderHistory extends State<OrderHistory> {
  var history = SalesOperation();
  late Future<List<DataOrderModel>> _orderHistory;

  @override
  void initState() {
    super.initState();
    _orderHistory =
        history.getOrderInformation(int.parse(widget.id!.toString()));
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
                        DataColumn(label: Text('Payment')),
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
    this.payment,
    this.date,
    this.staff,
  );

  final String productName;
  final String price;
  final String size;
  final String quantity;
  final String payment;
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
        DataCell(Text(row.payment)),
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
            orderHistory[index].getPayment.toString(),
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
