// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class ProposalEditorPanel extends StatefulWidget {
  final TextContent? content;
  final ScrollController scrollController;
  final QuillController quillController;

  const ProposalEditorPanel({
    super.key,
    required this.content,
    required this.scrollController,
    required this.quillController,
  });

  @override
  State<ProposalEditorPanel> createState() => _ProposalEditorPanelState();
}

/**
 * 
 */
class _ProposalEditorPanelState extends State<ProposalEditorPanel> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: _decoration(theme),
          child: QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                  controller: widget.quillController)),
        ),
        Expanded(
          child: Container(
            decoration: _decoration(theme),
            child: quill.QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: widget.quillController,
                padding: const EdgeInsets.all(16),
              ),
              focusNode: _focusNode,
              scrollController: widget.scrollController,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _decoration(ThemeData theme) {
    return BoxDecoration(
      color: theme.colorScheme.background, // Include the color inside BoxDecoration
      border: Border.all(
        color: theme.dividerColor, // Set the color of the border
        width: 0.5, // Set the width of the border
      ),
      borderRadius: BorderRadius.circular(1), // Set the border radius for rounded corners
    );
  }

  /**
   * 
   */
  DefaultStyles _customStyles() {
    final theme = Theme.of(context);

    return DefaultStyles(
      h1: DefaultListBlockStyle(
          TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground.withOpacity(0.8)),
          VerticalSpacing(16, 0),
          VerticalSpacing(0, 0),
          null,
          null),
      h2: DefaultListBlockStyle(
          TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground.withOpacity(0.7)),
          VerticalSpacing(16, 0),
          VerticalSpacing(0, 0),
          null,
          null),
      h3: DefaultListBlockStyle(
          TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground.withOpacity(0.6)),
          VerticalSpacing(16, 0),
          VerticalSpacing(0, 0),
          null,
          null),
      paragraph: DefaultListBlockStyle(
          TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground.withOpacity(0.87)),
          VerticalSpacing(16, 0),
          VerticalSpacing(0, 0),
          null,
          null),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
