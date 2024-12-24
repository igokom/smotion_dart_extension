extension MapExtensions<K, V> on Map<K, V> {
  V? get(K key, {V Function()? orElse}) {
    if (containsKey(key)) {
      return this[key];
    }
    if (orElse != null) return orElse();
    throw UnsupportedError('$key');
  }

  bool get hasAllNullValues => values.every((value) => value == null);

  Map<TKey, TValue> convert<TKey, TValue>(
      TKey Function(K, V) getKey,
      TValue Function(K, V) getValue, {
        bool Function(K, V)? where,
      }) =>
      {
        for (final e in entries)
          if (where == null || where(e.key, e.value))
            getKey(e.key, e.value): getValue(e.key, e.value)
      };

  Iterable<T> select<T>(T Function(K key, V value) get) =>
      entries.map((e) => get(e.key, e.value));
}

extension NullMapExtensions<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}