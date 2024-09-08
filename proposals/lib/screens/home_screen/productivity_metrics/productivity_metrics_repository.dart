
// ignore_for_file: slash_for_doc_comments

import 'package:proposals/models/item_bloc/items_repository.dart';
import 'package:proposals/screens/home_screen/productivity_metrics/productivity_metrics.dart';

class ProductivityMetricsRepository implements ItemRepository<ProductivityMetrics, dynamic> {
  
  /**
   * 
   */
  @override
  Future<ProductivityMetrics> fetchItem(parameters) async{
    await Future.delayed(const Duration(seconds: 1)); 
    return ProductivityMetrics( avgTime: '13.9h', proposalsCompleted: '191');
  }

  /**
   * 
   */  
  @override
  Future<void> updateItem(ProductivityMetrics item) {
    throw UnimplementedError();
  }

}