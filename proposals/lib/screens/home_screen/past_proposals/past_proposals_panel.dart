// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/models/listem_items_bloc/list_items_bloc_provider.dart';
import 'package:proposals/screens/home_screen/past_proposals/past_proposal.dart';
import 'package:proposals/screens/home_screen/past_proposals/past_proposal_repository.dart';

class PastProposalsPanel extends StatefulWidget {
  const PastProposalsPanel({super.key});

  @override
  State<PastProposalsPanel> createState() => _PastProposalsPanelState();
}

class _PastProposalsPanelState extends State<PastProposalsPanel> {
  @override
  Widget build(BuildContext context) {
    return ListItemsBlocProviderBuilder<PastProposal, dynamic>()
        .setBloc((p0) => ListItemBloc<PastProposal, dynamic>(
            repository: PastProposalsRepository())
          ..add(LoadItems<PastProposal, dynamic>(null)))
        .setOnSuccessful(_onSuccessful)
        .setOnError(() => Container())
        .setOnSelectedItem(_onSuccessful)
        .build();
  }

  /**
   * 
   */
  Widget _onSuccessful(List<PastProposal> proposals, PastProposal? selected) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Past Proposals',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              'View All',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width, // Take the full width
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Project Team')),
                DataColumn(label: Text('Artifacts')),
                DataColumn(label: Text('Last Modified')),
              ],
              rows: proposals.map((proposal) {
                return DataRow(cells: [
                  DataCell(Text(proposal.title, style: theme.textTheme.bodyMedium)),
                  DataCell(Text(proposal.projectName, style: theme.textTheme.bodyMedium)),
                  DataCell(Text('${proposal.files} files', style: theme.textTheme.bodyMedium)),
                  DataCell(Text(proposal.lastModified, style: theme.textTheme.bodyMedium)),
                ]);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
