/// * ApiException
class ApiException implements Exception {
  ApiException(this.message);

  String message;
  @override
  String toString() => 'API Exception: $message';
}

/// * AppException
class AppException implements Exception {
  AppException(this.message);

  String message;
  @override
  String toString() => message;
}
