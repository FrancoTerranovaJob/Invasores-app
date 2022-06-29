abstract class UserRepositoryException implements Exception {
  final Object? error;
  final StackTrace stackTrace;

  UserRepositoryException(this.error, this.stackTrace);

  @override
  String toString() => error.toString();
}

class InitializeAppException extends UserRepositoryException {
  InitializeAppException(super.error, super.stackTrace);
}
