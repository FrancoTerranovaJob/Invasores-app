import 'package:kiwi/kiwi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../clean/data/providers/configuration/configuration_provider.dart';
import '../clean/data/providers/configuration/i_configuration_provider.dart';

class PreferencesModule {
  static Future<bool> preferencesModuleInitialize() async {
    final preferencesInstance = await SharedPreferences.getInstance();
    KiwiContainer().registerSingleton<IConfigurationProvider>(
      (container) => ConfigurationProvider(preferences: preferencesInstance),
    );
    return true;
  }
}
