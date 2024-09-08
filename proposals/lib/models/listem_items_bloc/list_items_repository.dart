// ignore_for_file: slash_for_doc_comments

interface class  ListItemsRepository<T, P> {
  
  /**
   * 
   */
  Future<List<T>> fetchItems(P parameters) async {
    return []; 
  }

}