import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';

import 'i_api_provider.dart';

class OfflineApiProvider extends IApiProvider {
  final dbProvider = KiwiContainer().resolve<IDataBaseProvider>();
  @override
  Future<String> getData() async {
    try {
      return 'offline data';
    } catch (e) {
      return '';
    }
  }
}
