import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_starships_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_vehicles_response.dart';

import 'i_api_provider.dart';

class ApiProvider extends IApiProvider {
  final dio = KiwiContainer().resolve<Dio>();

  ApiProvider() {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true));
  }
  @override
  Future<GetCharactersResponse> getPeople({String? nextPageUrl}) async {
    var url = '${IApiProvider.apiUrl}/people';
    if (nextPageUrl != null && nextPageUrl.contains(url)) {
      final result = await dio.get(nextPageUrl);
      final characters = GetCharactersResponse.fromJson(result.data);

      return characters;
    } else {
      final result = await dio.get(url);
      final characters = GetCharactersResponse.fromJson(result.data);

      return characters;
    }
  }

  @override
  Future<GetPlanetsResponse> getPlanets({String? nextPageUrl}) async {
    var url = '${IApiProvider.apiUrl}/planets';

    if (nextPageUrl != null && nextPageUrl.contains(url)) {
      final result = await dio.get(nextPageUrl);
      final planets = GetPlanetsResponse.fromJson(result.data);

      return planets;
    } else {
      final result = await dio.get(url);
      final planets = GetPlanetsResponse.fromJson(result.data);

      return planets;
    }
  }

  @override
  Future<GetStarShipsResponse> getStarships({String? nextPageUrl}) async {
    try {
      var url = '${IApiProvider.apiUrl}/starships';

      if (nextPageUrl != null && nextPageUrl.contains(url)) {
        final result = await dio.get(nextPageUrl);
        final starships = GetStarShipsResponse.fromJson(result.data);

        return starships;
      } else {
        final result = await dio.get(url);
        final starships = GetStarShipsResponse.fromJson(result.data);

        return starships;
      }
    } catch (e) {
      return GetStarShipsResponse(starships: [], nextPageUrl: null);
    }
  }

  @override
  Future<GetVehiclesResponse> getVehicles({String? nextPageUrl}) async {
    try {
      var url = '${IApiProvider.apiUrl}/vehicles';

      if (nextPageUrl != null && nextPageUrl.contains(url)) {
        final result = await dio.get(nextPageUrl);
        final vehicles = GetVehiclesResponse.fromJson(result.data);

        return vehicles;
      } else {
        final result = await dio.get(url);
        final vehicles = GetVehiclesResponse.fromJson(result.data);

        return vehicles;
      }
    } catch (e) {
      return GetVehiclesResponse(vehicles: [], nextPageUrl: null);
    }
  }
}
