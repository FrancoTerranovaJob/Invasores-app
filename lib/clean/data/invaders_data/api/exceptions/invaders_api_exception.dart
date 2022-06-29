abstract class InvadersApiException implements Exception {
  final Object? error;
  final StackTrace stackTrace;

  InvadersApiException(this.error, this.stackTrace);

  @override
  String toString() => error.toString();
}

class GetInvadersException extends InvadersApiException {
  GetInvadersException(super.error, super.stackTrace);
}

class GetPlanetException extends InvadersApiException {
  GetPlanetException(super.error, super.stackTrace);
}

class GetStarShipsException extends InvadersApiException {
  GetStarShipsException(super.error, super.stackTrace);
}

class GetVehiclesException extends InvadersApiException {
  GetVehiclesException(super.error, super.stackTrace);
}

class DioException extends InvadersApiException {
  DioException(super.error, super.stackTrace);
}
