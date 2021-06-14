class NetworkException implements Exception {
  final String message;

  NetworkException({this.message});

  @override
  String toString() {
    if (message == null) return 'NetworkException';
    return message;
  }
}
