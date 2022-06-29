abstract class IDataBaseProvider {
  Future<bool> createDataBase();
  Future<bool> saveInvaders(List<Map<String, dynamic>> invaderList);
  Future<List<Map<dynamic, dynamic>>> getInvaders();
}
