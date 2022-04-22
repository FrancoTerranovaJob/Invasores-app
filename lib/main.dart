import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/core/welcome_screen.dart';
import 'package:urbe_solution/modules/database_module.dart';
import 'package:urbe_solution/modules/preferences_module.dart';
import 'package:urbe_solution/modules/providers_module.dart';
import 'package:urbe_solution/modules/repository_module.dart';
import 'package:urbe_solution/modules/use_case_module.dart';
import 'clean/presentation/core/core_bloc/core_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesModule.preferencesModuleInitialize();
  await DatabaseModule.databaseInitialize();
  await ProvidersModule.providersInitialize();
  await RepositoryModule.repositoryInitialize();
  await UseCaseModule.useCaseInitialize();
  /* await KiwiContainer()
      .resolve<IDataBaseProvider>()
      .addCharacters(SetCharactersRequest(characters: const [
        CharactersDB(
            id: '5',
            name: 'pepe Skywalker',
            eyesColor: 'blue',
            hairColor: 'brown',
            height: '324',
            skinColor: 'black',
            gender: 'female',
            fromPlanetId: 'fokushima',
            bornYear: '344',
            vehiclesId: ['1234'],
            starShipsId: ['334'])
      ]));
  await KiwiContainer()
      .resolve<IDataBaseProvider>()
      .getConsolidatedCharacters();*/
  runApp(const UberSolution());
}

class UberSolution extends StatelessWidget {
  const UberSolution({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Urbe Solution',
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
        home: BlocProvider(
          create: (context) => CoreBloc()..add(InitializeAppEvent()),
          child: WelcomeScreen(),
        ));
  }
}
