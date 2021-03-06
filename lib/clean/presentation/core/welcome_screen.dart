import 'package:InvadersApp/clean/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../invaders/invaders_list/ui/invader_list.dart';
import 'core_bloc/core_bloc.dart';
import 'pages/splash_content.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        if (state is InitializeAppState) {
          return SplashContent();
        }
        if (state is InitializedAppState) {
          return HomePage();
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}