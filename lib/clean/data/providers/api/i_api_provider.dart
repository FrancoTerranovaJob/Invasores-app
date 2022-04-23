import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_starships_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_vehicles_response.dart';

abstract class IApiProvider {
  static const apiUrl = 'https://swapi.dev/api';
  Future<GetCharactersResponse> getPeople({String? nextPageUrl});
  Future<GetPlanetsResponse> getPlanets({String? nextPageUrl});
  Future<GetVehiclesResponse> getVehicles({String? nextPageUrl});
  Future<GetStarShipsResponse> getStarships({String? nextPageUrl});
}
