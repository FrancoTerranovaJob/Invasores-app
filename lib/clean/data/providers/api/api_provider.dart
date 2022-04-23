import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';

import 'i_api_provider.dart';

class ApiProvider extends IApiProvider {
  final api = KiwiContainer().resolve<Dio>();
  @override
  Future<GetCharactersResponse> getPeople({int? pageNumber}) async {
    var url = '${IApiProvider.apiUrl}/people';
    if (pageNumber != null) {
      final result = await api.get(url, queryParameters: {'page': pageNumber});
      final result1 = GetCharactersResponse.fromJson(
          {'characters': result.data['results']});

      return result1;
    } else {
      final result = await api.get(url);
      final result1 = GetCharactersResponse.fromJson(
          {'characters': result.data['results']});

      return result1;
    }
  }

  @override
  Future<GetPlanetsResponse> getPlanets({String? pageNumber}) async {
    if (pageNumber != null) {
      final result = await api.get(pageNumber);
      final result1 = GetPlanetsResponse.fromJson(result.data);

      return result1;
    } else {
      var url = '${IApiProvider.apiUrl}/planets';
      final result = await api.get(url);
      final result1 = GetPlanetsResponse.fromJson(result.data);

      return result1;
    }
  }
}
