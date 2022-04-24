import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';

import '../repository/i_repository.dart';

class GetDataUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<ConsolidatedData> call() async {
    return await repository.getCharacters();
  }
}
