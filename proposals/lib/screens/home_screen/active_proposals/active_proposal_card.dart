// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/screens/editor/proposal_editor/proposal_editor_screen.dart';
import 'package:proposals/screens/home_screen/active_proposals/active_proposal.dart';

class ActiveProposalCard extends StatefulWidget {
  final ActiveProposal proposal;

  const ActiveProposalCard({super.key, required this.proposal});

  @override
  State<ActiveProposalCard> createState() => _ActiveProposalCardState();
}

/**
 * 
 */
class _ActiveProposalCardState extends State<ActiveProposalCard> {
  bool _isHovered = false;

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProposalEditorScreen()),
          );
        },
        child: SizedBox(
          width: 300,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: _isHovered ? theme.colorScheme.secondary.withOpacity(0.3) : theme.cardColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProposalEditorScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(theme),
                      const SizedBox(height: 8),
                      _buildDescription(theme),
                      const SizedBox(height: 8),
                      _buildFooter(theme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * 
   */
  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  /**
   * 
   */
  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.secondary,
          child: Text(widget.proposal.title[0], style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.onSecondary)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            widget.proposal.title,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }

  /**
   * 
   */
  Widget _buildDescription(ThemeData theme) {
    return Text(widget.proposal.description, style: theme.textTheme.bodySmall);
  }

  /**
   * 
   */
  Widget _buildFooter(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last Modified: ${widget.proposal.lastModified}',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          'Project Team: ${widget.proposal.projectName}',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          'Files: ${widget.proposal.files}',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
