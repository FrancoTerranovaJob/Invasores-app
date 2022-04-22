import 'models/request/set_characters_request.dart';
import 'models/response/get_consolidated_characters.dart';

abstract class IDataBaseProvider {
  Future<bool> createDataBase();
  Future<bool> addCharacter(SetCharactersRequest setCharactersRequest);
  Future<GetConsolidatedCharacters> getConsolidatedCharacters();
}
