import 'package:urbe_solution/clean/domain/entities/invader.dart';
import 'package:urbe_solution/clean/domain/reports_domain/repository/i_reports_repository.dart';

class ReportUseCase {
  final IReportsRepository repository;
  ReportUseCase(this.repository);

  Future<bool> call(Invader invader) async {
    return await repository.reportPerson(invader);
  }
}