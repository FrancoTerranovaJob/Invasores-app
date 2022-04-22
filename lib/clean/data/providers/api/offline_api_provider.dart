import 'i_api_provider.dart';

class OfflineApiProvider extends IApiProvider {
  @override
  Future<String> getData() async {
    try {
      return 'offline data';
    } catch (e) {
      return '';
    }
  }
}
