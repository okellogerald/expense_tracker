extension DateTimeExtension on DateTime {
  String toISOString() {
    return toUtc().toIso8601String();
  }
}

extension DateTimeStringExtension on String {
  DateTime fromISOString() {
    return DateTime.parse(this);
  }
}
