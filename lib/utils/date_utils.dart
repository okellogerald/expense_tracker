import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  DateTime parseWith(String pattern) {
    return DateFormat(pattern).parse(pattern);
  }

  DateTime parse() {
    if (contains("T")) {
      return DateFormat("yyyy-MM-ddThh:mm:ss").parse(this, true).toLocal();
    }
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(this, true).toLocal();
  }
}

extension DateTimeExt on DateTime {
  static DateTime fromJson(
    String json, [
    String pattern = "yyyy-MM-ddThh:mm:ss",
  ]) {
    return DateFormat(pattern).parse(json);
  }

  String toJson([String pattern = "yyyy-MM-ddThh:mm:ss"]) =>
      DateFormat(pattern).format(this);

  String format([String? pattern]) {
    return DateFormat(pattern ?? "dd/MM/yyyy").format(this);
  }

  String formatDefaultToDateMonth([String? pattern]) {
    if (year == DateTime.now().year) {
      return DateFormat(pattern ?? "MMM dd").format(this);
    }

    return DateFormat(pattern ?? "MMM dd").format(this);
  }

  int get timestamp {
    return toUtc().millisecondsSinceEpoch;
  }

  String get utcISOString {
    return toUtc().toIso8601String();
  }
}

extension DateTimeRangeExt on DateTimeRange {
  String format() {
    if (start.year == end.year) {
      if (start.month == end.month) {
        return "${start.format("dd")} - ${end.format("dd")} ${start.format("MMM yy")}";
      }
      return "${start.format("dd MMM")} - ${end.format("dd MMM")} ${start.format("yy")}";
    }
    return "${start.format("dd MMM yy")} - ${end.format("dd MMM yy")}";
  }
}
