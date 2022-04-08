import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InventoryList extends StatefulWidget {
  @override
  _InventoryList createState() => _InventoryList();
}

class _InventoryList extends State<InventoryList> {
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
  }

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
              sortAscending: _sortAscending,
              sortColumnIndex: 1,
              rowsPerPage: 5,
              columns: [
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
    this.valueProductName,
    this.valuePrice,
    this.valueSize,
    this.valueQuantity,
    this.valueDate,
  );

  final String valueProductName;
  final String valuePrice;
  final String valueSize;
  final String valueQuantity;
  final String valueDate;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _paymentsList(context);
  }

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsList(context).length) return null;
    final row = _paymentsList(context)[index];
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
      ],
    );
  }

  @override
  int get rowCount => _paymentsList(context).length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _paymentsList(BuildContext context) {
  try {
    return List.generate(
      4,
      (index) {
        return _Row(
          '',
          '',
          '',
          '',
          '',
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
      );
    });
  }
}
