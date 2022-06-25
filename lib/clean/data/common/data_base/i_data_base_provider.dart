abstract class IDataBaseProvider {
  Future<bool> createDataBase(bool firstTime);
  Future<bool> saveInvaders(List<Map<String, dynamic>> invaderList);
  Future<List<Map<String, dynamic>>> getInvaders();
}