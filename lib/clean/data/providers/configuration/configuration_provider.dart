import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbe_solution/clean/data/providers/configuration/i_configuration_provider.dart';

class ConfigurationProvider extends IConfigurationProvider {
  final SharedPreferences preferences;

  ConfigurationProvider({required this.preferences});

  @override
  Future<bool> isOnline() async {
    final result = preferences.getBool('isOnline');
    if (result == null) {
      preferences.setBool('isOnline', false);
      return false;
    }
    return result;
  }

  @override
  Future<bool> setIsOnline(bool isOnline) async {
    await preferences.setBool('isOnline', isOnline);
    return true;
  }

  @override
  Future<bool> getIsFirstTime() async {
    final result = preferences.getBool('isFirstTime');
    if (result == null) {
      preferences.setBool('isFirstTime', false);
      return true;
    }
    return result;
  }
}