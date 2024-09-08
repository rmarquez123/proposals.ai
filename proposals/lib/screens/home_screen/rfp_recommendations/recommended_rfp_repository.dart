// ignore_for_file: slash_for_doc_comments

import 'package:proposals/models/listem_items_bloc/list_items_repository.dart';
import 'package:proposals/screens/home_screen/rfp_recommendations/recommended_rfp.dart';

/**
 * 
 */
class RecommendedRfpRepository
    implements ListItemsRepository<RecommendedRfp, dynamic> {
  /**
   * 
   */
  @override
  Future<List<RecommendedRfp>> fetchItems(parameters) async {
    await Future.delayed(const Duration(seconds: 1));  
    return [
      RecommendedRfp(title: 'Longitudinal Study on ...', date: '17 Jul'),
      RecommendedRfp(title: 'Innovative Approaches to...', date: '30 Jul'),
      RecommendedRfp(title: 'Evaluating the Effectiveness...', date: '1 Aug'),
      RecommendedRfp(title: 'Genomic Research on Rare...', date: '15 Aug'),
    ];
  }
}