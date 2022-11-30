abstract class Failure implements Exception {
  String get message;
}

class ErrorLoginWithEmail extends Failure {
  @override
  final String message;
  ErrorLoginWithEmail({required this.message});
}
