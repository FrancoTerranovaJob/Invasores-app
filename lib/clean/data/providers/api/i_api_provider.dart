abstract class IApiProvider {
  static const apiUrl = 'https://swapi.dev/api/';
  Future<String> getData();
}
