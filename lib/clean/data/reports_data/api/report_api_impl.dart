import 'package:dio/dio.dart';

import 'i_report_api.dart';
import 'request/report_invader_request.dart';

class ReportApiImpl implements IReportApi {
  final Dio http;
  ReportApiImpl({required this.http});
  @override
  Future<bool> reportInvader(ReportInvaderRequest reportInvaderRequest) async {
    await http.post('/posts', data: reportInvaderRequest.toJson());
    return true;
  }
}