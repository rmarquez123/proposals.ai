// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';

/**
 * 
 */
class OutlinePanel extends StatefulWidget {
  final TextContent? content;
  final QuillController zefyrController;
  final ScrollController scrollController;

  /**
   * 
   */
  const OutlinePanel({
    super.key,
    required this.content,
    required this.zefyrController,
    required this.scrollController,
  });

  @override
  State<OutlinePanel> createState() => _OutlinePanelState();
}

class _OutlinePanelState extends State<OutlinePanel> {
  bool _isOutlineVisible = false; // Visibility state of the outline

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 360,
      color: theme.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Proposal Outline',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: Icon(_isOutlineVisible
                        ? Icons.expand_less
                        : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _isOutlineVisible = !_isOutlineVisible;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          if (_isOutlineVisible)
            widget.content == null
                ? const Center(child: Text('No content available'))
                : Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    child: IntrinsicHeight(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300.0,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                buildOutline(widget.content!.getOutline(), 1),
                          ),
                        ),
                      ),
                    ),
                  ),
        ],
      ),
    );
  }

  List<Widget> buildOutline(List<OutlineNode> nodes, [int indent = 0]) {
    final theme = Theme.of(context);
    List<Widget> widgets = [];
    for (var node in nodes) {
      widgets.add(InkWell(
        onTap: () {
          _scrollToSection(node.text);
        },
        child: Padding(
          padding: EdgeInsets.only(left: indent * 16.0, top: 0.0, bottom: 8.0),
          child: Text(
            "> ${node.text}",
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14 -
                  (node.level * 2.0), // Adjust font size based on heading level
            ),
          ),
        ),
      ));
      if (node.children.isNotEmpty) {
        widgets.addAll(buildOutline(node.children, indent + 1));
      }
    }
    return widgets;
  }

  /**
   * 
   */
  void _scrollToSection(String sectionTitle) {
    // Find the document offset for the section title  
    final doc = widget.zefyrController.document;
    int offset = 0;
    for (var node in doc.root.children) {
      if (node.toPlainText().trim() == sectionTitle.trim()) {
        break;
      }
      offset += node.length;
    }

    widget.scrollController.animateTo(
      offset.toDouble(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
