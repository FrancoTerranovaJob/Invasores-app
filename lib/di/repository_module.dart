import 'package:urbe_solution/clean/data/common/configuration/i_configuration_provider.dart';
import 'package:urbe_solution/clean/data/common/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/data/invaders_data/api/i_invaders_api.dart';
import 'package:urbe_solution/clean/domain/invaders_domain/repository/invaders_repository.dart';

import '../clean/domain/invaders_domain/repository/i_invaders_repository.dart';
import 'kiwi.dart';

class RepositoryModule {
  static void repositoryInitialize() async {
    final IDataBaseProvider db = services.resolve<IDataBaseProvider>();
    final IConfigurationProvider configuration =
        services.resolve<IConfigurationProvider>();
    final IInvadersApi api = services.resolve<IInvadersApi>();
    services.registerSingleton<IInvadersRepository>(
        (container) => InvadersRepository(db, configuration, api));
  }
}