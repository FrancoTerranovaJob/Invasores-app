import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'kiwi.dart';

class HttpModule {
  static void initializeHttpModule() {
    services.registerSingleton<Dio>(
        (container) => Dio(BaseOptions(baseUrl: 'https://swapi.dev/api'))
          ..interceptors.add(PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true)),
        name: 'invadersApi');
    services.registerSingleton<Dio>(
        (container) =>
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'))
              ..interceptors.add(PrettyDioLogger(
                  requestHeader: true,
                  requestBody: true,
                  responseBody: true,
                  responseHeader: true)),
        name: 'reportApi');
  }
}
