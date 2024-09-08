// ignore_for_file: slash_for_doc_comments

import 'package:proposals/models/listem_items_bloc/list_items_repository.dart';
import 'package:proposals/screens/editor/proposal_editor/suggestions/suggestion.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';

/**
 * 
 */
class SuggestionRepository implements ListItemsRepository<Suggestion, dynamic> {
  /**
   * 
   */
  @override
  Future<List<Suggestion>> fetchItems(dynamic parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    final result = <Suggestion>[
      Suggestion(
        title: 'Compliance',
        type: "Compliance",
        content: TextContent([
          Insert(
              insert:
                  'The RFP states that the introduction must include a summary of the tasks and the overall budget and should not exceed 200 words.')
        ]),
      ),
      Suggestion(
        title: 'Experience/Qualifications',
        type: "Compliance",
        content: TextContent([
          Insert(
              insert:
                  "'Summarize how your company is best situated to meet the project goals including: \n- Mentioning last year’s XYZ project where your demonstrated working knowledge with Technology ABC \n- Your company’s ISO 9001 certification is relevant. \n- Your key team member’s (Ricardo Marquez) experience with DEF'")
        ]),
      ),
      Suggestion(
          title: 'Project Sponsor Goals',
          type: "Compliance",
          content: TextContent([
            Insert(
                insert:
                    'Make sure to restate the project sponsor’s high level goals and desired outcomes to achieve HIJK')
          ])),
    ];
    return result;
  }
}
