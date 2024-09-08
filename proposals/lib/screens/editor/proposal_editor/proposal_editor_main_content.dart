// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:proposals/models/item_bloc/item_bloc_builder.dart';
import 'package:proposals/models/item_bloc/items_bloc.dart';
import 'package:proposals/models/item_bloc/items_event.dart';
import 'package:proposals/screens/editor/proposal_editor/aihelp_panel/aihelp_panel.dart';
import 'package:proposals/screens/editor/proposal_editor/proposal_editor_panel.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content_repository.dart';

/**
 * 
 */
class ProposalEditorMainContent extends StatefulWidget {
  /**
   * 
   */
  const ProposalEditorMainContent({super.key});

  /**
   * 
   */
  @override
  State<ProposalEditorMainContent> createState() =>
      _ProposalEditorMainContentState();
}

class _ProposalEditorMainContentState extends State<ProposalEditorMainContent> {
  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ItemBlocProviderBuilder<TextContent, dynamic>()
        .setBloc((context) =>
            ItemBloc<TextContent, dynamic>(repository: TextContentRepository())
              ..add(LoadItem(null)))
        .setOnLoading(() => _onLoadedWidget(null))
        .setOnItemLoaded(_onLoadedWidget)
        .setOnError((p0) => Container())
        .build();
  }

  /**
   * 
   */
  Widget _onLoadedWidget(TextContent? item) {
    final scrollController = ScrollController();
    var quillController = _getDocController(item);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.primaryColorLight,
        foregroundColor: theme.colorScheme.onPrimary,
        title: Text(
          "Proposal Narrative",
          style: theme.textTheme.titleSmall,
        ),
      ),
      body: Row(children: [
        Expanded(
            child: ProposalEditorPanel(
          content: item,
          scrollController: scrollController,
          quillController: quillController,
        )),
        AiHelpPanel(
          content: item,
          scrollController: scrollController,
          docController: quillController,
        )
      ]),
    );
  }

  QuillController _getDocController(TextContent? item) {
    final QuillController quillController;
    if (item != null) {
      final Document doc;
      final json = item.toJson();
      try {
        doc = Document.fromJson(json);
      } catch (e) {
        print(e);
        rethrow;
      }
      quillController = QuillController(
          document: doc,
          selection: const TextSelection(baseOffset: 0, extentOffset: 0));
    } else {
      quillController = QuillController.basic();
    }
    return quillController;
  }
}
