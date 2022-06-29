import '../repository/i_user_repository.dart';

class InitializeAppUseCase {
  final IUserRepository repository;
  InitializeAppUseCase(this.repository);
  Future<bool> call() async {
    return await repository.initializeApp();
  }
}

class ChangeModeUseCase {
  final IUserRepository repository;
  ChangeModeUseCase(this.repository);

  Future<bool> call(bool isOnline) async {
    if (!isOnline) {
      await repository.disableOnline();
      return false;
    } else {
      await repository.enableOnline();
      return true;
    }
  }
}

class GetModeUseCase {
  final IUserRepository repository;

  GetModeUseCase(this.repository);

  Future<bool> call() async {
    return await repository.getIsOnline();
  }
}
