import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/configuration/i_configuration_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/modules/database_module.dart';
import 'package:urbe_solution/modules/preferences_module.dart';

import 'package:urbe_solution/modules/providers_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesModule.preferencesModuleInitialize();
  await DatabaseModule.databaseInitialize();
  await ProvidersModule.providersInitialize();
  final isFirstTime =
      await KiwiContainer().resolve<IConfigurationProvider>().getIsFirstTime();
  if (isFirstTime) {
    await KiwiContainer().resolve<IDataBaseProvider>().createDataBase();
  }
  await KiwiContainer().resolve<IDataBaseProvider>().addCharacter('name');
  await KiwiContainer().resolve<IDataBaseProvider>().getCharacters();
  runApp(const UberSolution());
}

class UberSolution extends StatelessWidget {
  const UberSolution({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white,
      ),
    );
  }
}
