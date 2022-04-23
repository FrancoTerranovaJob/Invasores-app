import 'package:urbe_solution/clean/data/providers/api/response/get_consolidated_characters_response.dart';

abstract class IApiProvider {
  static const apiUrl = 'https://swapi.dev/api/';
  Future<GetConsolidatedCharactersResponse> getData();
}
