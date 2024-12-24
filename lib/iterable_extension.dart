extension IterableNullableExtensions<E> on Iterable<E>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension IterableExtensions<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E element) getKey) => fold(
    <K, List<E>>{},
        (map, E element) => map
      ..update(
        getKey(element),
            (list) => list..add(element),
        ifAbsent: () => [element],
      ),
  );

  E firstOr(E or) {
    for (final E element in this) {
      return element;
    }
    return or;
  }

  Iterable<T> mapIndexed<T>(T Function(E element, int index) f) {
    int index = 0;
    return map((element) => f(element, index++));
  }

  N sum<N extends num>(N Function(E element) select) =>
      length == 0 ? 0 as N : map(select).sum();
}

extension MapEntryIterableExtensions<K, V> on Iterable<MapEntry<K, V>> {
  Map<K, V> toMap() => Map.fromEntries(this);
}

extension NumIterableExtensions<N extends num> on Iterable<N> {
  N sum() => reduce((sum, i) => sum + i as N);
}