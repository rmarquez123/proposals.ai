import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class BudgetItem {
  BudgetItem(this.id, this.itemName, this.estimatedCost, this.actualCost);

  final int id;
  final String itemName;
  final double estimatedCost;
  final double actualCost;
}

class BudgetDataSource extends DataGridSource {
  BudgetDataSource({required List<BudgetItem> budgetItems}) {
    _budgetItems = budgetItems
        .map<DataGridRow>((item) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: item.id),
              DataGridCell<String>(columnName: 'itemName', value: item.itemName),
              DataGridCell<double>(columnName: 'estimatedCost', value: item.estimatedCost),
              DataGridCell<double>(columnName: 'actualCost', value: item.actualCost),
            ]))
        .toList();
  }

  List<DataGridRow> _budgetItems = [];

  @override
  List<DataGridRow> get rows => _budgetItems;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[0].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[1].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toStringAsFixed(2)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[3].value.toStringAsFixed(2)),
      ),
    ]);
  }
}
