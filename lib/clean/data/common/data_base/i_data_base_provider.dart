abstract class IDataBaseProvider {
  Future<bool> createDataBase();
  Future<bool> saveInvaders(int pageNumber, Map<String, dynamic> invaderList);
  Future<Map<dynamic, dynamic>> getInvaders(int pageNumber);
  bool canLoadMore(int nextPage);
}