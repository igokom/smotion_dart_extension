import 'comparison.dart';

extension ListExtensions<TItem> on List<TItem> {
  void addIfNotNull(TItem? item) {
    if (item != null) add(item);
  }

  void addAllIfNotNull(Iterable<TItem?>? items) {
    if (items == null) return;

    for (final TItem? item in items) {
      addIfNotNull(item);
    }
  }

  TItem? getByIndexOrNull(int index) {
    if (length > index) return this[index];
    return null;
  }

  bool containsAll(Iterable<TItem> other) {
    for (final item in other) {
      if (!contains(item)) return false;
    }
    return true;
  }

  /// Null is treated like greater value
  List<TItem> customSortBy<TProperty1 extends Comparable<dynamic>?,
  TProperty2 extends Comparable<dynamic>?>(
      TProperty1 Function(TItem item) by, {
        bool descending = false,
        TProperty2 Function(TItem item)? thenBy,
        TProperty2 Function(TItem item)? thenByDescending,
      }) =>
      this
        ..sort(
              (item0, item1) => compareBy(
            item0,
            item1,
            by,
            descending: descending,
            thenBy: thenBy,
            thenByDescending: thenByDescending,
          ),
        );

  List<TItem> sortAsIs<TProperty1 extends Comparable<dynamic>>({
    bool descending = false,
  }) =>
      customSortBy<TProperty1, Comparable<dynamic>>(
            (item) => item as TProperty1,
        descending: descending,
      );
}