import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/project_team/project_team_page.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';

class ProjectTeamScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.projectteam),
          Expanded(child: ProjectTeamPage(),),
        ],
      ),
    );
  }

}