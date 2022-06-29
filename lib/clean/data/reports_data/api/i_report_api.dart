import 'request/report_invader_request.dart';

abstract class IReportApi {
  Future<bool> reportInvader(ReportInvaderRequest reportInvaderRequest);
}
