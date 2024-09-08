import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/rfp/rfp_summary_main_content.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestions_panel.dart';

class RfpSummaryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.rfp),
          const Expanded(child: RfpSummaryMainContent(),),
          const SuggestionsPanel(content: null,),
        ],
      ),
    );
  }

}