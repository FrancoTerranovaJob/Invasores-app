import 'package:shared_preferences/shared_preferences.dart';
import '../clean/data/common/configuration/configuration_provider.dart';
import '../clean/data/common/configuration/i_configuration_provider.dart';
import 'kiwi.dart';

class PreferencesModule {
  static void preferencesModuleInitialize() async {
    final preferencesInstance = await SharedPreferences.getInstance();
    services.registerSingleton<IConfigurationProvider>(
      (container) => ConfigurationProvider(preferences: preferencesInstance),
    );
  }
}