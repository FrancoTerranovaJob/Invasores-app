abstract class ReportApiException implements Exception {
  final Object? error;
  final StackTrace stackTrace;

  ReportApiException(this.error, this.stackTrace);

  @override
  String toString() => error.toString();
}

class SendReportException extends ReportApiException {
  SendReportException(super.error, super.stackTrace);
}

class DioException extends ReportApiException {
  DioException(super.error, super.stackTrace);
}
