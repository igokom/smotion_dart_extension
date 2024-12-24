/// Null is treated like greater value
int compareBy<TItem, TProperty1 extends Comparable<dynamic>?,
    TProperty2 extends Comparable<dynamic>?>(
  TItem item0,
  TItem item1,
  TProperty1 Function(TItem item) by, {
  bool descending = false,
  TProperty2 Function(TItem item)? thenBy,
  TProperty2 Function(TItem item)? thenByDescending,
}) {
  int compare<TProperty extends Comparable<dynamic>?>(
          TProperty Function(TItem item) by,
          {bool descending = false}) =>
      _compare(item0, item1, by, descending: descending);

  var compareResult = compare(by, descending: descending);
  if (compareResult == 0) {
    if (thenBy != null) {
      compareResult = compare(thenBy, descending: false);
    }
    if (thenByDescending != null) {
      compareResult = compare(thenByDescending, descending: true);
    }
  }
  return compareResult;
}

int _compare<TItem, TProperty extends Comparable<dynamic>?>(
  TItem item0,
  TItem item1,
  TProperty Function(TItem item) by, {
  bool descending = false,
}) {
  if (item0 == null) {
    if (item1 == null) return 0;
    return 1;
  }
  if (item1 == null) return -1;

  final field0 = by(item0);
  final field1 = by(item1);

  if (field0 == null) {
    if (field1 == null) return 0;
    return 1;
  }
  if (field1 == null) return -1;

  return descending ? field1.compareTo(field0) : field0.compareTo(field1);
}
