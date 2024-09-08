// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/models/listem_items_bloc/list_items_bloc_provider.dart';
import 'package:proposals/screens/home_screen/rfp_recommendations/recommended_rfp.dart';
import 'package:proposals/screens/home_screen/rfp_recommendations/recommended_rfp_card.dart';
import 'package:proposals/screens/home_screen/rfp_recommendations/recommended_rfp_repository.dart';

class RecommendedRfpsPanel extends StatefulWidget {
  const RecommendedRfpsPanel({super.key});

  @override
  State<RecommendedRfpsPanel> createState() => _RecommendedRfpsPanelState();
}

class _RecommendedRfpsPanelState extends State<RecommendedRfpsPanel> {
  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ListItemsBlocProviderBuilder<RecommendedRfp, dynamic>()
        .setBloc((p0) => ListItemBloc<RecommendedRfp, dynamic>(
            repository: RecommendedRfpRepository())
          ..add(LoadItems(null)))
        .setOnSuccessful(_onSuccessfulWidget)
        .setOnError(() => Container())
        .setOnSelectedItem(_onSuccessfulWidget)
        .setOnInitial(_onLoadingWidget)
        .build();
  }

  Widget _onLoadingWidget() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'New RFP Recommendations',
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5, // Display a fixed number of placeholders
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: theme.colorScheme.surface, // Placeholder background color
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.description, size: 40, color: theme.colorScheme.onSurface.withOpacity(0.5)), // Placeholder icon color
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 20,
                              color: theme.colorScheme.onSurface.withOpacity(0.3), // Placeholder title color
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 100,
                              height: 16,
                              color: theme.colorScheme.onSurface.withOpacity(0.3), // Placeholder date color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /**
   * 
   */
  Widget _onSuccessfulWidget(
      List<RecommendedRfp> rfps, RecommendedRfp? selected) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'New RFP Recommendations',
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView(
            children: rfps
                .map((e) => RecommendedRfpCard(title: e.title, date: e.date))
                .toList(),
          ),
        ),
      ],
    );
  }
}
