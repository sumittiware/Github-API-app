class RequestException implements Exception {
  RequestException([this.message = '']);

  final String message;
}
