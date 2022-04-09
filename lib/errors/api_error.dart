class ApiError {
  final String message;
  final String code;
  ApiError._(this.code, this.message);

  factory ApiError.fromJson(var json) {
    return ApiError._(json['code'], json['message']);
  }

  @override
  String toString() => 'ERROR: $message';
}