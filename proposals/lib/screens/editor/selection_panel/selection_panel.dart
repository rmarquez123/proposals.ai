// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/corporate_details/corporate_details_screen.dart';
import 'package:proposals/screens/editor/knowledge_items/knowledge_screen.dart';
import 'package:proposals/screens/editor/project_team/project_team_screen.dart';
import 'package:proposals/screens/editor/rfp/rfp_summary_screen.dart';
import 'package:proposals/screens/editor/selection_panel/artifacts/artifacts_panel.dart';
import 'package:proposals/screens/editor/selection_panel/selection_item_widget_factory.dart';
import 'package:proposals/styling/styles.dart';

/**
 * 
 */
class SelectionPanel extends StatelessWidget {

  /**
   * 
   */
  final EditorRoute currentRoute;

  /**
   * 
   */
  const SelectionPanel({super.key, required this.currentRoute});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final factory = SelectionItemWidgetFactory(currentRoute);
    return Container(
      width: 250,
      color: theme.colorScheme.background,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Utilities Installation Proposal',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          AppStyles.spacer(),
          factory.selectionItem(Icons.search, 'Search', context),
          AppStyles.spacer(),
          factory.selectionItem(Icons.article, 'RFP', context,
              screen: RfpSummaryScreen(), route: EditorRoute.rfp),
          AppStyles.spacer(),
          factory.selectionItem(Icons.library_books, 'Knowledge', context,
              screen: KnowledgeScreen(), route: EditorRoute.knowledge),
          AppStyles.spacer(),
          factory.selectionItem(Icons.group, 'Project Team', context,
              screen: ProjectTeamScreen(), route: EditorRoute.projectteam),
          AppStyles.spacer(),
          factory.selectionItem(Icons.business, 'Corporate Details', context,
              screen: CorporateDetailsScreen(),
              route: EditorRoute.corporatedetails),
          AppStyles.spacer(),
          factory.selectionItem(
              Icons.description, 'Proposal Artifacts', context,
              isCategory: true),
          AppStyles.spacer(),  
          ArtifactsPanel(factory: factory),
        ],
      ),
    );
  }
}
