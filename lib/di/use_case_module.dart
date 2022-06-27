import 'package:kiwi/kiwi.dart';

import '../clean/domain/invaders_domain/repository/i_invaders_repository.dart';
import '../clean/domain/invaders_domain/use_cases/invaders_use_cases.dart';
import '../clean/domain/reports_domain/repository/i_reports_repository.dart';
import '../clean/domain/reports_domain/use_cases/report_use_cases.dart';
import '../clean/domain/user_domain/repository/i_user_repository.dart';
import '../clean/domain/user_domain/use_cases/user_use_cases.dart';
import 'kiwi.dart';

class UseCaseModule {
  static void useCaseInitialize() async {
    final IUserRepository userRepository = services.resolve<IUserRepository>();
    final IInvadersRepository invadersRepository =
        services.resolve<IInvadersRepository>();
    final IReportsRepository reportsRepository =
        services.resolve<IReportsRepository>();
    KiwiContainer().registerSingleton<InitializeAppUseCase>(
        (container) => InitializeAppUseCase(userRepository));

    KiwiContainer().registerSingleton<GetInvadersDataUseCase>(
        (container) => GetInvadersDataUseCase(invadersRepository));
    KiwiContainer().registerSingleton<SyncDataUseCase>(
        (container) => SyncDataUseCase(invadersRepository));
    KiwiContainer().registerSingleton<ChangeModeUseCase>(
        (container) => ChangeModeUseCase(userRepository));
    KiwiContainer().registerSingleton<GetModeUseCase>(
        (container) => GetModeUseCase(userRepository));
    KiwiContainer().registerSingleton<ReportUseCase>(
        (container) => ReportUseCase(reportsRepository));
  }
}