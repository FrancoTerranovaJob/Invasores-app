import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/core/core_bloc/core_bloc.dart';
import 'package:urbe_solution/clean/presentation/core/pages/splash_content.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        if (state is InitializeAppState) {
          return SplashContent();
        }
        if (state is InitializedAppState) {
          return Container(
            color: Colors.red,
          );
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}