abstract class Failure implements Exception {
  String get message;
}

class ErrorLoginWithEmail extends Failure {
  @override
  final String message;
  ErrorLoginWithEmail({required this.message});
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String message;
  ErrorGetLoggedUser({required this.message});
}

class ErrorLoginPhone extends Failure {
  @override
  final String message;
  ErrorLoginPhone({required this.message});
}

class ErrorLogout extends Failure {
  @override
  final String message;
  ErrorLogout({required this.message});
}

class NotAutomaticRetrieved implements Failure {
  final String verificationId;
  final String message;
  NotAutomaticRetrieved(this.verificationId, {required this.message});
}

class InternalError implements Failure {
  @override
  final String message;
  InternalError({required this.message});
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({required this.message});
}
