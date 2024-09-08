import 'package:flutter/material.dart';
import '../active_proposals/active_proposal.dart';

class PastProposals extends StatelessWidget {
  final List<ActiveProposal> proposals;

  const PastProposals({super.key, required this.proposals});

  @override
  Widget build(BuildContext context) {
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
        DataTable(
          columns: [
            DataColumn(label: Text('Name', style: theme.textTheme.bodySmall)),
            DataColumn(label: Text('Project Team', style: theme.textTheme.bodySmall)),
            DataColumn(label: Text('Artifacts', style: theme.textTheme.bodySmall)),
            DataColumn(label: Text('Last Modified', style: theme.textTheme.bodySmall)),
          ],
          rows: proposals.map((proposal) {
            return DataRow(cells: [
              DataCell(Text(proposal.title, style: theme.textTheme.bodySmall)),
              DataCell(Text(proposal.projectName, style: theme.textTheme.bodySmall)),
              DataCell(Text('${proposal.files} files', style: theme.textTheme.bodySmall)),
              DataCell(Text(proposal.lastModified, style: theme.textTheme.bodySmall)),
            ]);
          }).toList(),
        ),
      ],
    );
  }
}
