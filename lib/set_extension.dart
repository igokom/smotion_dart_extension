extension SetWithNullsExtensions<TItem> on Set<TItem?> {
  void addAllIfNotNull(Iterable<TItem?>? items) {
    if (items != null) items.forEach(add);
  }

  void addIfNotNull(TItem? item) {
    if (item != null) add(item);
  }
}