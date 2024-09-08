abstract class ListItemState<T> {
  final List<T> items;
  final T? selectedItem;

  ListItemState({required this.items, this.selectedItem});
}

class ListItemInitial<T> extends ListItemState<T> {
  ListItemInitial() : super(items: []);
}

class ListItemLoaded<T> extends ListItemState<T> {
  ListItemLoaded({required super.items, super.selectedItem});
}

class ListItemError<T> extends ListItemState<T> {
  final String message;

  ListItemError({required this.message}) : super(items: []);
}
