import 'package:flutter/material.dart';
import 'package:retail_store_management_system/models/InventoryModel.dart';
import 'package:retail_store_management_system/operations/Collector.dart';

class InventoryList extends StatefulWidget {
  const InventoryList();

  @override
  _InventoryList createState() => _InventoryList();
}

class _InventoryList extends State<InventoryList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: (MediaQuery.of(context).size.width) / 1.5,
            height: (MediaQuery.of(context).size.height),
            child: PaginatedDataTable(
              showCheckboxColumn: false,
              showFirstLastButtons: true,
              sortColumnIndex: 1,
              rowsPerPage: 5,
              columns: [
                DataColumn(label: Text('Product ID')),
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Size')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Date')),
              ],
              source: _DataSource(context),
            ),
          ),
        ),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueProductID,
    this.valueProductName,
    this.valuePrice,
    this.valueSize,
    this.valueQuantity,
    this.valueDate,
  );
  final String valueProductID;
  final String valueProductName;
  final String valuePrice;
  final String valueSize;
  final String valueQuantity;
  final String valueDate;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    rowPurchases = _paymentsList();
  }

  List<InventoryModel> newPurchases = [];
  List<_Row> rowPurchases = [];

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsList().length) return null;
    final row = _paymentsList()[index];
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
        DataCell(Text(row.valueProductID)),
        DataCell(Text(row.valueProductName)),
        DataCell(Text(row.valuePrice)),
        DataCell(Text(row.valueSize)),
        DataCell(Text(row.valueQuantity)),
        DataCell(Text(row.valueDate)),
      ],
    );
  }

  @override
  int get rowCount => _paymentsList().length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _paymentsList() {
  try {
    return List.generate(
      Collector.getInventory.length,
      (index) {
        return _Row(
          Collector.getInventory[index].getProductId.toString(),
          Collector.getInventory[index].getProductInvName.toString(),
          Collector.getInventory[index].getProductInvPrice.toString(),
          Collector.getInventory[index].getProductInvSize.toString(),
          Collector.getInventory[index].getProductInvQty.toString(),
          Collector.getInventory[index].getProductInvDate.toString(),
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
      );
    });
  }
}
