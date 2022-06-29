abstract class IUserRepository {
  Future<bool> enableOnline();
  Future<bool> disableOnline();
  Future<bool> getIsOnline();
  Future<bool> initializeApp();
}
