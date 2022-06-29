import 'package:shared_preferences/shared_preferences.dart';

import 'i_configuration_provider.dart';

class ConfigurationProvider extends IConfigurationProvider {
  final SharedPreferences preferences;

  ConfigurationProvider({required this.preferences});

  @override
  Future<bool> isOnline() async {
    final result = preferences.getBool('isOnline');
    if (result == null) {
      preferences.setBool('isOnline', false);
      return true;
    }
    return result;
  }

  @override
  Future<bool> setIsOnline(bool isOnline) async {
    try {
      await preferences.setBool('isOnline', isOnline);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> getIsFirstTime() async {
    final result = preferences.getBool('isFirstTime');
    if (result == null) {
      return true;
    }
    return result;
  }

  @override
  Future<bool> setIsFirstTime(bool isFirstTime) async {
    try {
      return await preferences.setBool('isFirstTime', isFirstTime);
    } catch (e) {
      return false;
    }
  }
}
