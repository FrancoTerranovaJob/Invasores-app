import 'package:InvadersApp/di/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'clean/domain/user_domain/use_cases/user_use_cases.dart';
import 'clean/presentation/core/core_bloc/core_bloc.dart';
import 'clean/presentation/core/welcome_screen.dart';

import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesModule.preferencesModuleInitialize();
  HttpModule.initializeHttpModule();
  await DatabaseModule.databaseInitialize();
  ProvidersModule.providersInitialize();
  RepositoryModule.repositoryInitialize();
  UseCaseModule.useCaseInitialize();

  runApp(const InvadersApp());
}

class InvadersApp extends StatelessWidget {
  const InvadersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Invaders',
        theme: Themes.mainTheme(context),
        home: BlocProvider(
          create: (context) => CoreBloc(
              initializeUseCase: services.resolve<InitializeAppUseCase>())
            ..add(InitializeAppEvent()),
          child: WelcomeScreen(),
        ));
  }
}