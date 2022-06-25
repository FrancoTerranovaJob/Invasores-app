import '../../../data/reports_data/api/i_report_api.dart';
import '../../../data/reports_data/api/request/report_invader_request.dart';
import '../../entities/invader.dart';
import 'i_reports_repository.dart';

class ReportsRepositoryImpl implements IReportsRepository {
  final IReportApi api;

  ReportsRepositoryImpl(this.api);

  @override
  Future<bool> reportPerson(Invader invader) async {
    await api.reportInvader(ReportInvaderRequest(
        id: 1, date: DateTime.now().toString(), name: invader.name));
    return true;
  }
}