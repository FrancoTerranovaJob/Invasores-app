import 'package:urbe_solution/clean/data/reports_data/api/request/report_invader_request.dart';

abstract class IReportApi {
  Future<bool> reportInvader(ReportInvaderRequest reportInvaderRequest);
}