import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_planets_request.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_transports_request.dart';

import 'models/request/set_characters_request.dart';
import 'models/response/get_consolidated_characters.dart';

abstract class IDataBaseProvider {
  Future<bool> createDataBase();
  Future<bool> addCharacters(SetCharactersRequest setCharactersRequest);
  Future<GetConsolidatedCharacters> getConsolidatedCharacters();
  Future<bool> addPlanets(SetPlanetsRequest setPlanetsRequest);
  Future<bool> addTransports(SetTransportsRequest setTransportsRequest);
}
