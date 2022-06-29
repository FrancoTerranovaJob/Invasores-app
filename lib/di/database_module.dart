import '../clean/data/common/data_base/data_base_provider.dart';
import '../clean/data/common/data_base/i_data_base_provider.dart';
import 'kiwi.dart';

class DatabaseModule {
  static Future<bool> databaseInitialize() async {
    services.registerSingleton<IDataBaseProvider>(
        (container) => DataBaseProvider());
    return true;
  }
}
