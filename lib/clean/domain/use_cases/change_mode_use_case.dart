import 'package:kiwi/kiwi.dart';

import '../repository/i_repository.dart';

class ChangeModeUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<bool> call(bool isOnline) async {
    if (!isOnline) {
      await repository.disableOnline();
      return false;
    } else {
      await repository.enableOnline();
      return true;
    }
  }
}
