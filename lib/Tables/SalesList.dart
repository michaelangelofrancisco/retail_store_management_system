import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesList createState() => _SalesList();
}

class _SalesList extends State<SalesList> {
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
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height),
            child: PaginatedDataTable(
              showCheckboxColumn: false,
              showFirstLastButtons: true,
              sortAscending: _sortAscending,
              sortColumnIndex: 1,
              rowsPerPage: 9,
              columns: [
                DataColumn(label: Text('Order ID')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Staff')),
                DataColumn(label: Text('Info')),
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
    this.valueOrderID,
    this.valueDate,
    this.valueStaff,
    this.valueInfo,
  );

  final String valueOrderID;
  final String valueDate;
  final String valueStaff;
  final Widget valueInfo;

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
        DataCell(Text(row.valueOrderID)),
        DataCell(Text(row.valueDate)),
        DataCell(Text(row.valueStaff)),
        DataCell((row.valueInfo)),
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
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              textStyle: TextStyle(
                fontSize: 10,
              ),
            ),
            child: const Text('INFO'),
            onPressed: () {},
          ),
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
        Text(''),
      );
    });
  }
}
