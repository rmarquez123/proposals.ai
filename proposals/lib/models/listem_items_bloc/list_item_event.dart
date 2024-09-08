// ignore_for_file: slash_for_doc_comments

abstract class ListItemEvent<T, P> {}

class LoadItems<T, P> extends ListItemEvent<T, P> {

  final P parameters;
  
  /**
   * 
   */
  LoadItems(this.parameters); 

  P getParameters() {
    return this.parameters;
  }
}

class SelectItem<T, P> extends ListItemEvent<T, P> {
  final T selectedItem;

  SelectItem(this.selectedItem);
}
