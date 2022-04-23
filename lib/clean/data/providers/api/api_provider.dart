import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_consolidated_characters_response.dart';

import 'i_api_provider.dart';

class ApiProvider extends IApiProvider {
  final api = KiwiContainer().resolve<Dio>();
  @override
  Future<GetConsolidatedCharactersResponse> getData() async {
    final result = await api.get('${IApiProvider.apiUrl}/people');
    final result1 = GetConsolidatedCharactersResponse.fromJson(
        {'characters': result.data['results']});
    print(result1);
    return result1;
  }
}
