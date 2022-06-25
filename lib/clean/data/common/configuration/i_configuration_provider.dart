abstract class IConfigurationProvider {
  Future<bool> isOnline();
  Future<bool> setIsOnline(bool isOnline);
  Future<bool> getIsFirstTime();
  Future<bool> setIsFirstTime(bool isFirstTime);
}
