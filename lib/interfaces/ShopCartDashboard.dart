import 'package:flutter/material.dart';
import 'package:retail_store_management_system/models/OrderModel.dart';

class ShopCartDashboard extends StatefulWidget {
  final List<OrderModel>? newPurchaes;
  const ShopCartDashboard({Key? key, required this.newPurchaes})
      : super(key: key);

  @override
  _ShopCartDashboard createState() => _ShopCartDashboard();
}

class _ShopCartDashboard extends State<ShopCartDashboard> {
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    int totalPrice = 0;

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
        Expanded(
          child: Container(
            width: (MediaQuery.of(context).size.width) / 1.5,
            height: (MediaQuery.of(context).size.height),
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
