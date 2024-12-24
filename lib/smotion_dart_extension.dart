library smotion_dart_extensions;

import 'comparison.dart';

extension StackTraceExtensions on StackTrace {
  static const _defaultLineCount = 20;
  static const _lineSeparator = "\n";

  StackTrace tryRemoveRange({required int start, required int end}) {
    final frames = toString().split(_lineSeparator);
    if (frames.length <= end) return this;

    frames.removeRange(start, end);
    return StackTrace.fromString(frames.join(_lineSeparator));
  }

  String toStringShort({
    String? indent,
    int? lineCount = _defaultLineCount,
  }) =>
      toString()
          .split("\n")
          .take(lineCount ?? _defaultLineCount)
          .join("\n${indent ?? ''}");
}

extension DateTimeExtensions on DateTime? {
  DateTime getOrZero() =>
      this == null ? DateTime.fromMicrosecondsSinceEpoch(0) : this!;
}