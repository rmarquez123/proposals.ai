import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';
import 'package:proposals/screens/editor/project_budget/spreadsheet.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestions_panel.dart';

class ProjectBudgetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.budget),
          const Expanded(child: ProjectBudgetPage(),),
          const SuggestionsPanel(content: null,),
        ],
      ),
    );
  }

}