import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

import 'i_api_provider.dart';

class OnlineApiProvider extends IApiProvider {
  final api = KiwiContainer().resolve<Dio>();
  @override
  Future<String> getData() async {
    final result = await api.get('${IApiProvider.apiUrl}/vehicles');
    print(result);
    return 'onlineData';
  }
}
