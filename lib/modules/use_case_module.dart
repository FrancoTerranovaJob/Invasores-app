import 'package:kiwi/kiwi.dart';

import 'package:urbe_solution/clean/domain/use_cases/initialize_app_use_case.dart';

class UseCaseModule {
  static Future<bool> useCaseInitialize() async {
    KiwiContainer().registerSingleton<InitializeAppUseCase>(
        (container) => InitializeAppUseCase());
    return true;
  }
}
