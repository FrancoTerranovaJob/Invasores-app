import 'package:urbe_solution/clean/data/common/configuration/i_configuration_provider.dart';

import '../clean/data/common/data_base/data_base_provider.dart';
import '../clean/data/common/data_base/i_data_base_provider.dart';
import 'kiwi.dart';

class DatabaseModule {
  static Future<bool> databaseInitialize() async {
    final bool isFirstTime =
        await services.resolve<IConfigurationProvider>().getIsFirstTime();
    services.registerSingleton<IDataBaseProvider>(
        (container) => DataBaseProvider()..createDataBase(isFirstTime));
    return true;
  }
}