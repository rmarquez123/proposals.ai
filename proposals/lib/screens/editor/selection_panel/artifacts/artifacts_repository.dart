// ignore_for_file: slash_for_doc_comments

import 'package:proposals/models/listem_items_bloc/list_items_repository.dart';
import 'package:proposals/screens/editor/selection_panel/artifacts/artifact.dart';

class ArtifactsRepository implements ListItemsRepository<Artifact, dynamic> {
  /**
   * 
   */
  @override
  Future<List<Artifact>> fetchItems(parameters) async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }
}
