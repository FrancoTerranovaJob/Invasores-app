import 'package:urbe_solution/clean/data/common/configuration/i_configuration_provider.dart';
import 'package:urbe_solution/clean/data/common/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/data/invaders_data/api/i_invaders_api.dart';
import 'package:urbe_solution/clean/data/reports_data/api/i_report_api.dart';
import 'package:urbe_solution/clean/domain/invaders_domain/repository/invaders_repository.dart';
import 'package:urbe_solution/clean/domain/reports_domain/repository/i_reports_repository.dart';
import 'package:urbe_solution/clean/domain/reports_domain/repository/reports_repository_impl.dart';
import 'package:urbe_solution/clean/domain/user_domain/repository/i_user_repository.dart';
import 'package:urbe_solution/clean/domain/user_domain/repository/user_repository_impl.dart';

import '../clean/domain/invaders_domain/repository/i_invaders_repository.dart';
import 'kiwi.dart';

class RepositoryModule {
  static void repositoryInitialize() async {
    final IDataBaseProvider db = services.resolve<IDataBaseProvider>();
    final IConfigurationProvider configuration =
        services.resolve<IConfigurationProvider>();
    final IInvadersApi api = services.resolve<IInvadersApi>();

    final IReportApi reportsApi = services.resolve<IReportApi>();
    services.registerSingleton<IInvadersRepository>(
        (container) => InvadersRepository(db, configuration, api));

    services.registerSingleton<IUserRepository>(
        (container) => UserRepositoryImpl(configuration, db));

    services.registerSingleton<IReportsRepository>(
        (container) => ReportsRepositoryImpl(reportsApi));
  }
}