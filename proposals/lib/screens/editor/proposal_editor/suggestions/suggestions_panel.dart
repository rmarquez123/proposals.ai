// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/models/listem_items_bloc/list_items_bloc_provider.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestion.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestion_repository.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';

/**
 * 
 */
class SuggestionsPanel extends StatefulWidget {
  final TextContent? content;

  /**
   * 
   */
  const SuggestionsPanel({super.key, required this.content});

  @override
  State<SuggestionsPanel> createState() => _SuggestionsPanelState();
}

class _SuggestionsPanelState extends State<SuggestionsPanel> {
  bool _isCommentsVisible = true; // Visibility state of the comments

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return ListItemsBlocProviderBuilder<Suggestion, dynamic>()
        .setBloc((p0) => ListItemBloc<Suggestion, dynamic>(
            repository: SuggestionRepository())
          ..add(LoadItems(null)))
        .setOnSelectedItem(_onSuccessfulWidget)
        .setOnSuccessful(_onSuccessfulWidget)
        .setOnError(() => Container())
        .setOnInitial(() => Container())
        .build();
  }

  /**
   * 
   */
  Widget _onSuccessfulWidget(
      List<Suggestion> suggestion, Suggestion? selected) {
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
                    'Comments',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: Icon(_isCommentsVisible
                        ? Icons.expand_less
                        : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _isCommentsVisible = !_isCommentsVisible;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          if (_isCommentsVisible)
            Expanded(
              child: ListView(
                children: suggestion
                    .map((e) =>
                        _suggestionItem(e.title, e.content.inserts[0].insert))
                    .toList(),
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary, // Button color
              foregroundColor: Colors.white, // Text color
            ),
            onPressed: () {
              // Handle the revise action here
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Revise it for me'),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Ask assistant',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Handle the send action here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

/**
 * 
 */
  Widget _suggestionItem(String title, String description) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Card(
        elevation: 2.0, // Adds shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
