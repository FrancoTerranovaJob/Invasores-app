import 'package:InvadersApp/clean/data/common/commons.dart';
import 'package:InvadersApp/clean/domain/user_domain/repository/exceptions/user_repository_exception.dart';

import 'i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IConfigurationProvider configuration;
  final IDataBaseProvider db;
  UserRepositoryImpl(this.configuration, this.db);

  @override
  Future<bool> initializeApp() async {
    try {
      final isFirstTime = await configuration.getIsFirstTime();
      if (isFirstTime) {
        await db.createDataBase();

        await configuration.setIsFirstTime(false);
      } else {
        configuration.setIsOnline(false);
        await db.createDataBase();
      }

      return true;
    } catch (error, stack) {
      throw InitializeAppException(error, stack);
    }
  }

  @override
  Future<bool> disableOnline() async {
    return await configuration.setIsOnline(false);
  }

  @override
  Future<bool> getIsOnline() async {
    return await configuration.isOnline();
  }

  @override
  Future<bool> enableOnline() async {
    return await configuration.setIsOnline(true);
  }
}
