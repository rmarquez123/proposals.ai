abstract class ItemRepository<T, P> {
  Future<T> fetchItem(P parameters);
  Future<void> updateItem(T item);
}
