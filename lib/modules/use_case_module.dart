import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/use_cases/change_mode_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_data_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_mode_use_case.dart';

import 'package:urbe_solution/clean/domain/use_cases/initialize_app_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/is_valid_data.dart';
import 'package:urbe_solution/clean/domain/use_cases/report_use_case.dart';

import '../clean/domain/use_cases/sync_data_use_case.dart';

class UseCaseModule {
  static Future<bool> useCaseInitialize() async {
    KiwiContainer().registerSingleton<InitializeAppUseCase>(
        (container) => InitializeAppUseCase());
    KiwiContainer()
        .registerSingleton<IsValidData>((container) => IsValidData());
    KiwiContainer()
        .registerSingleton<GetDataUseCase>((container) => GetDataUseCase());
    KiwiContainer()
        .registerSingleton<SyncDataUseCase>((container) => SyncDataUseCase());
    KiwiContainer().registerSingleton<ChangeModeUseCase>(
        (container) => ChangeModeUseCase());
    KiwiContainer()
        .registerSingleton<GetModeUseCase>((container) => GetModeUseCase());
    KiwiContainer()
        .registerSingleton<ReportUseCase>((container) => ReportUseCase());
    return true;
  }
}
