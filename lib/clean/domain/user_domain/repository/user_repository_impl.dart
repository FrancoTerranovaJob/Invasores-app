import '../../../data/common/configuration/i_configuration_provider.dart';
import '../../../data/common/data_base/i_data_base_provider.dart';
import 'i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IConfigurationProvider configuration;
  final IDataBaseProvider db;
  UserRepositoryImpl(this.configuration, this.db);

  @override
  Future<bool> initializeApp() async {
    final isFirstTime = await configuration.getIsFirstTime();
    if (isFirstTime) {
      await db.createDataBase(true);

      await configuration.setIsFirstTime(false);
    } else {
      configuration.setIsOnline(false);
      await db.createDataBase(false);
    }

    return true;
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