import 'package:dio/dio.dart';
import 'package:urbe_solution/clean/data/invaders_data/api/i_invaders_api.dart';

import '../clean/data/invaders_data/api/invaders_api_impl.dart';
import 'kiwi.dart';

class ProvidersModule {
  static void providersInitialize() async {
    final invadersApi = services.resolve<Dio>('invadersApi');
    final reportApi = services.resolve<Dio>('reportApi');
    services.registerSingleton<IInvadersApi>(
      (container) => InvadersApiImpl(api: invadersApi),
    );
  }
}