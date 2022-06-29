import '../../entities/invader.dart';
import '../repository/i_reports_repository.dart';

class ReportUseCase {
  final IReportsRepository repository;
  ReportUseCase(this.repository);

  Future<bool> call(Invader invader) async {
    return await repository.reportPerson(invader);
  }
}
