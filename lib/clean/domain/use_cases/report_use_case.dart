import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/character.dart';

import '../repository/i_repository.dart';

class ReportUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<bool> call(Character character) async {
    return await repository.reportPerson(character);
  }
}
