import 'package:flutter/material.dart';
import 'package:retail_store_management_system/interfaces/OrderHistory.dart';
import 'package:retail_store_management_system/models/SalesModel.dart';
import 'package:retail_store_management_system/operations/SalesOperation.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesList createState() => _SalesList();
}

class _SalesList extends State<SalesList> {
  var _sortAscending = true;
  var controller = SalesOperation();
  late Future<List<SalesModel>> _salesList;

  @override
  void initState() {
    _salesList = controller.getSalesInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List<SalesModel>>(
            future: _salesList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Expanded(
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
                        DataColumn(label: Text('Staff')),
                        DataColumn(label: Text('Info')),
                      ],
                      source: _DataSource(context, snapshot.data!.toList()),
                    ),
                  ),
                );
              }

              return const CircularProgressIndicator();
            }),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueOrderID,
    this.valueStaff,
    this.valueInfo,
  );

  final String valueOrderID;
  final String valueStaff;
  final Widget valueInfo;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this.salesList) {
    salesList = salesList;
    _paymentsList(salesList);
  }

  final BuildContext context;
  List<SalesModel> salesList = [];
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsList(salesList).length) return null;
    final row = _paymentsList(salesList)[index];
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
        DataCell(Text(row.valueStaff)),
        DataCell((row.valueInfo), onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height),
                      child: OrderHistory(
                        id: int.parse(row.valueOrderID),
                      ),
                    ),
                  ],
                );
              });
        }),
      ],
    );
  }

  @override
  int get rowCount => _paymentsList(salesList).length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _paymentsList(List<SalesModel> salesList) {
  try {
    return List.generate(
      salesList.length,
      (index) {
        return _Row(
          salesList[index].getOrderID.toString(),
          salesList[index].getStaff.toString(),
          TextButton(
            child: const Text('List'),
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
        const Text(''),
      );
    });
  }
}
