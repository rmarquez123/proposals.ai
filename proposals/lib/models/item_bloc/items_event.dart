abstract class ItemEvent<T, P> {}

class LoadItem<T, P> extends ItemEvent<T, P> {
  final P parameters;

  LoadItem(this.parameters);

  P getParameters() {
    return parameters;
  }
}

class UpdateItem<T, P> extends ItemEvent<T, P> {
  final T item;

  UpdateItem(this.item);
}
