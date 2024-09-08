// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/screens/home_screen/active_proposals/active_proposal.dart';
import 'package:proposals/screens/home_screen/active_proposals/active_proposals_repository.dart';
import 'package:proposals/models/listem_items_bloc/list_items_bloc_provider.dart';
import 'package:proposals/screens/home_screen/active_proposals/active_proposal_card.dart';

/**
 * 
 */
class ActiveProposals extends StatefulWidget {
  const ActiveProposals({super.key});

  @override
  State<ActiveProposals> createState() => _ActiveProposalsState();
}

class _ActiveProposalsState extends State<ActiveProposals> {
  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ListItemsBlocProviderBuilder<ActiveProposal, dynamic>()
        .setBloc((context) => ListItemBloc<ActiveProposal, dynamic>(
            repository: ActiveProposalsRepository())
          ..add(LoadItems<ActiveProposal, dynamic>(null)))
        .setOnSuccessful(_setOnSuccessful)
        .setOnError(() => Container())
        .setOnSelectedItem(_setOnSuccessful)
        .setOnInitial(_onInitialWidget)
        .build();
  }

  Widget _onInitialWidget() {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Active Proposals',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.sort),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 240, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Display a fixed number of placeholders
            itemBuilder: (context, index) {
              return Container(
                width: 300, // Adjust width as needed
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
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
  Widget _setOnSuccessful(
      List<ActiveProposal> proposals, ActiveProposal? selected) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Active Proposals',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.sort),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 240, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: proposals.length,
            itemBuilder: (context, index) {
              return ActiveProposalCard(proposal: proposals[index]);
            },
          ),
        ),
      ],
    );
  }
}
