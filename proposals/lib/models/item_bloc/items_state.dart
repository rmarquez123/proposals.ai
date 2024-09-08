abstract class ItemState<T> {
  final T? item;

  ItemState({this.item});
}

class ItemInitial<T> extends ItemState<T> {
  ItemInitial() : super(item: null);
}

class ItemLoaded<T> extends ItemState<T> {
  ItemLoaded({required T item}) : super(item: item);
}

class ItemError<T> extends ItemState<T> {
  final String message;

  ItemError({required this.message}) : super(item: null);
}
