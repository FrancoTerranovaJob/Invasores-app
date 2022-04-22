import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/repository/i_repository.dart';

import '../clean/domain/repository/repository.dart';

class RepositoryModule {
  static Future<bool> repositoryInitialize() async {
    KiwiContainer().registerSingleton<IRepository>((container) => Repository());
    return true;
  }
}
