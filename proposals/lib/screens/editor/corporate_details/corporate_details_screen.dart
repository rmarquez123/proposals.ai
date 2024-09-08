import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/corporate_details/corporate_details_page.dart';
import 'package:proposals/screens/editor/selection_panel/selection_panel.dart';

class CorporateDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SelectionPanel(currentRoute: EditorRoute.corporatedetails),
          Expanded(
            child: CorporateDetailsPage(),
          ),
        ],
      ),
    );
  }
}
