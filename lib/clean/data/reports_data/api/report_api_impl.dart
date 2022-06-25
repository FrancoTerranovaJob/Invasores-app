import 'package:dio/dio.dart';
import 'package:urbe_solution/clean/data/reports_data/api/i_report_api.dart';
import 'package:urbe_solution/clean/data/reports_data/api/request/report_invader_request.dart';

class ReportApiImpl implements IReportApi {
  final Dio api;
  ReportApiImpl({required this.api});
  @override
  Future<bool> reportInvader(ReportInvaderRequest reportInvaderRequest) async {
    await api.post('/posts', data: reportInvaderRequest.toJson());
    return true;
  }
}