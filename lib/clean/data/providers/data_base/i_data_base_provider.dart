abstract class IDataBaseProvider {
  Future<bool> createDataBase();
  Future<bool> addCharacter(String name);
  Future<List> getCharacters();
}
