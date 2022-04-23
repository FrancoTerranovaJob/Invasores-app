import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';

abstract class IApiProvider {
  static const apiUrl = 'https://swapi.dev/api/';
  Future<GetCharactersResponse> getPeople({int? pageNumber});
  Future<GetPlanetsResponse> getPlanets({String? pageNumber});
}
