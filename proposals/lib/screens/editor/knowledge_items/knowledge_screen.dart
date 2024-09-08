import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/knowledge_items/knowledge_page.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';

class KnowledgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.knowledge),
          Expanded(
            child: SingleChildScrollView(
              child: KnowledgePage(), 
            ),
          ),
        ],
      ),
    );
  }
}
