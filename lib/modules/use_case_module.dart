import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_data_use_case.dart';

import 'package:urbe_solution/clean/domain/use_cases/initialize_app_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/is_valid_data.dart';

class UseCaseModule {
  static Future<bool> useCaseInitialize() async {
    KiwiContainer().registerSingleton<InitializeAppUseCase>(
        (container) => InitializeAppUseCase());
    KiwiContainer()
        .registerSingleton<IsValidData>((container) => IsValidData());
    KiwiContainer()
        .registerSingleton<GetDataUseCase>((container) => GetDataUseCase());
    return true;
  }
}
