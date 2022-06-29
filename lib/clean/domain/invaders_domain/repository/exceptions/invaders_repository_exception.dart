abstract class InvadersRepositoryException implements Exception {
  final Object? error;
  final StackTrace stackTrace;

  InvadersRepositoryException(this.error, this.stackTrace);

  @override
  String toString() => error.toString();
}

class GetOnlineDataException extends InvadersRepositoryException {
  GetOnlineDataException(super.error, super.stackTrace);
}

class GetOfflineDataException extends InvadersRepositoryException {
  GetOfflineDataException(super.error, super.stackTrace);
}

class SaveDataException extends InvadersRepositoryException {
  SaveDataException(super.error, super.stackTrace);
}
