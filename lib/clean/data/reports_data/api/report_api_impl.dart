import 'package:InvadersApp/clean/data/reports_data/api/exceptions/report_exception.dart';
import 'package:dio/dio.dart';

import 'i_report_api.dart';
import 'request/report_invader_request.dart';

class ReportApiImpl implements IReportApi {
  final Dio http;
  ReportApiImpl({required this.http});
  @override
  Future<bool> reportInvader(ReportInvaderRequest reportInvaderRequest) async {
    try {
      await http.post('/posts', data: reportInvaderRequest.toJson());
      return true;
    } on DioError catch (error, stack) {
      throw DioException(error, stack);
    } catch (error, stack) {
      throw SendReportException(error, stack);
    }
  }
}
