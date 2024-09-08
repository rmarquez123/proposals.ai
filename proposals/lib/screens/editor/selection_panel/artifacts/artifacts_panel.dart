// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/models/listem_items_bloc/list_items_bloc_provider.dart';
import 'package:proposals/models/routes.dart';
import 'package:proposals/screens/editor/project_budget/project_budget_screen.dart';
import 'package:proposals/screens/editor/proposal_editor/proposal_editor_screen.dart';
import 'package:proposals/screens/editor/selection_panel/artifacts/artifact.dart';
import 'package:proposals/screens/editor/selection_panel/artifacts/artifacts_repository.dart';
import 'package:proposals/screens/editor/selection_panel/selection_item_widget_factory.dart';
import 'package:proposals/styling/styles.dart';

class ArtifactsPanel extends StatefulWidget {
  final SelectionItemWidgetFactory factory;

  const ArtifactsPanel({super.key, required this.factory});

  @override
  State<ArtifactsPanel> createState() => _ArtifactsPanelState();
}

class _ArtifactsPanelState extends State<ArtifactsPanel> {
  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ListItemsBlocProviderBuilder<Artifact, dynamic>()
        .setBloc((p0) =>
            ListItemBloc<Artifact, dynamic>(repository: ArtifactsRepository())
              ..add(LoadItems(null)))
        .setOnInitial(_onLoadingWidget)
        .setOnSelectedItem(_onSuccessfulWidget)
        .setOnSuccessful(_onSuccessfulWidget)
        .setOnError(() => Container())
        .build();
  }

  /**
   * 
   */
  Widget _onLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loadingSelectionItem(),
          AppStyles.spacer(),
          _loadingSelectionItem(),
          AppStyles.spacer(),
          _loadingSelectionItem(),
          AppStyles.spacer(),
          _loadingSelectionItem(),
        ],
      ),
    );
  }

  /**
   * 
   */
  Widget _onSuccessfulWidget(List<Artifact> list, Artifact? selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.factory.selectionItem(
              Icons.text_snippet, 'Proposal Narrative', context,
              screen: const ProposalEditorScreen(),
              route: EditorRoute.proposaleditor),
          AppStyles.spacer(),
          widget.factory.selectionItem(Icons.description, 'Resumes/CVs', context),
          AppStyles.spacer(),
          widget.factory.selectionItem(Icons.schedule, 'Schedule', context),
          AppStyles.spacer(),
          widget.factory.selectionItem(Icons.attach_money, 'Budget', context,
              screen: ProjectBudgetScreen(), route: EditorRoute.budget),
        ],
      ),
    );
  }

  Widget _loadingSelectionItem() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          // width: 200,
          height: 20,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
