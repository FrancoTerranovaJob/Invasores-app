import 'i_api_provider.dart';

class OnlineApiProvider extends IApiProvider {
  @override
  Future<String> getData() async {
    return 'onlineData';
  }
}
