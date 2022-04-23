import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/api_provider.dart';

class ProvidersModule {
  static Future<bool> providersInitialize() async {
    KiwiContainer().registerSingleton<Dio>((container) => Dio());
    KiwiContainer().registerSingleton<IApiProvider>(
      (container) => ApiProvider(),
    );

    return true;
  }
}
