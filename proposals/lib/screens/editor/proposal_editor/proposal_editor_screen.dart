// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/proposal_editor/proposal_editor_main_content.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';

class ProposalEditorScreen extends StatelessWidget {
  

  /**
   * 
   */
  const ProposalEditorScreen({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.proposaleditor),
          Expanded(child: ProposalEditorMainContent()),
        ],
      ),
    );
  }
}
