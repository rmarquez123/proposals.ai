// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:proposals/screens/editor/proposal_editor/outline/outline_panel.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestions_panel.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';
import 'package:proposals/styling/styles.dart';

class AiHelpPanel extends StatelessWidget {
  final TextContent? content;
  final ScrollController scrollController;
  final QuillController docController;

  /**
   * 
   */
  const AiHelpPanel({super.key, required this.content, required this.scrollController, required this.docController});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinePanel(content: content,  scrollController: scrollController, zefyrController: docController,),
        AppStyles.spacer(),
        Expanded(child: SuggestionsPanel(content: content)),
      ],
    );
  }
}
