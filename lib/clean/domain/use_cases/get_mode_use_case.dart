import 'package:kiwi/kiwi.dart';

import '../repository/i_repository.dart';

class GetModeUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<bool> call() async {
    return await repository.getIsOnline();
  }
}
