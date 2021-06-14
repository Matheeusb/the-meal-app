class NetworkException implements Exception {
  final message;

  NetworkException({this.message});

  @override
  String toString() {
    if (message == null) return 'NetworkException';
    return message;
  }
}
