import 'package:flutter/material.dart';
import 'package:proposals/models/budget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProjectBudgetPage extends StatefulWidget {
  const ProjectBudgetPage({super.key});

  @override
  State<ProjectBudgetPage> createState() => _ProjectBudgetPageState();
}

class _ProjectBudgetPageState extends State<ProjectBudgetPage> {
  late BudgetDataSource _budgetDataSource;

  @override
  void initState() {
    super.initState();
    List<BudgetItem> budgetItems = getBudgetItems();
    _budgetDataSource = BudgetDataSource(budgetItems: budgetItems);
  }

  List<BudgetItem> getBudgetItems() {
    return [
      BudgetItem(1, 'Research', 5000, 4500),
      BudgetItem(2, 'Development', 15000, 16000),
      BudgetItem(3, 'Testing', 3000, 3200),
      BudgetItem(4, 'Deployment', 2000, 1800),
      BudgetItem(5, 'Marketing', 5000, 5200),
      // Add more budget items here
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Project Budget', style: theme.textTheme.headlineSmall),
        ),
        body: SfDataGrid(
          source: _budgetDataSource,
          columnResizeMode: ColumnResizeMode.onResize,
          columnWidthMode: ColumnWidthMode.fill,
          columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
          columns: <GridColumn>[
            GridColumn(
                columnName: 'id',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('ID', style: theme.textTheme.titleSmall),
                )),
            GridColumn(
                columnName: 'itemName',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Item Name', style: theme.textTheme.titleSmall),
                )),
            GridColumn(
                columnName: 'estimatedCost',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Estimated Cost', style: theme.textTheme.titleSmall),
                )),
            GridColumn(
                columnName: 'actualCost',
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Actual Cost', style: theme.textTheme.titleSmall),
                )),
          ],
        ));
  }
}
