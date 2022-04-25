import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';

import '../repository/i_repository.dart';

class SyncDataUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<ConsolidatedData> call() async {
    final result = await repository.syncData();

    return result;
  }
}
