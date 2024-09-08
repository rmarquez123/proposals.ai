import 'package:flutter/material.dart';
import 'package:proposals/screens/home_screen/new_proposal/new_proposal_card.dart';
import 'package:proposals/screens/home_screen/productivity_metrics/productivity_metrics_panel.dart';
import 'package:proposals/screens/home_screen/rfp_recommendations/recommended_rfps_panel.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductivityMetricsPanel(),
            SizedBox(height: 20),
            Expanded(child: RecommendedRfpsPanel()),
            SizedBox(height: 20),
            NewProposalCard(),
          ],
        ),
      ),
    );
  }
}
