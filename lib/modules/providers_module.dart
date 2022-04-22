import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/offline_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/online_api_provider.dart';

class ProvidersModule {
  static Future<bool> providersInitialize() async {
    KiwiContainer().registerSingleton<IApiProvider>(
        (container) => OnlineApiProvider(),
        name: 'OnlineApi');
    KiwiContainer().registerSingleton<IApiProvider>(
        (container) => OfflineApiProvider(),
        name: 'OfflineApi');

    return true;
  }
}
