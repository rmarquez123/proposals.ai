// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/item_bloc/item_bloc_builder.dart';
import 'package:proposals/models/item_bloc/items_bloc.dart';
import 'package:proposals/models/item_bloc/items_event.dart';
import 'package:proposals/screens/home_screen/productivity_metrics/statistics_card.dart';
import 'package:proposals/screens/home_screen/productivity_metrics/productivity_metrics.dart';
import 'package:proposals/screens/home_screen/productivity_metrics/productivity_metrics_repository.dart';

class ProductivityMetricsPanel extends StatefulWidget {
  const ProductivityMetricsPanel({super.key});

  @override
  State<ProductivityMetricsPanel> createState() => _ProductivityMetricsPanelState();
}

class _ProductivityMetricsPanelState extends State<ProductivityMetricsPanel> {
  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ItemBlocProviderBuilder<ProductivityMetrics, dynamic>()
        .setBloc((p0) => ItemBloc<ProductivityMetrics, dynamic>(
            repository: ProductivityMetricsRepository())
          ..add(LoadItem(null)))
        .setOnItemLoaded(onLoadedWidget)
        .setOnLoading(_onLoadingWidget)
        .setOnError((p0) => Container())
        .build();
  }

  /**
   * 
   */
  Widget onLoadedWidget(ProductivityMetrics item) {
    return const StatisticsCard(
      avgTime: '13.9h',
      proposalsCompleted: '191',
    );
  }

  /**
   * 
   */
  Widget _onLoadingWidget() {
    final theme = Theme.of(context);  

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Proposal Productivity Metrics',
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avg. Time Per Proposal',
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 50,
                      height: 14,
                      color: theme.colorScheme.onPrimary.withOpacity(0.3),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'No. of Proposals Completed',
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 50,
                      height: 14,
                      color: theme.colorScheme.onPrimary.withOpacity(0.3),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
