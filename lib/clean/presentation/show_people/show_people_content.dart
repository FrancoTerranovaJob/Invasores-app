import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/bloc/show_people_bloc.dart';
import 'package:urbe_solution/theme/app_theme.dart';

class ShowPeopleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.mainTheme(context).colorScheme.primary,
      body: SafeArea(child: BlocBuilder<ShowPeopleBloc, ShowPeopleState>(
          builder: (context, state) {
        return Container();
      })),
    );
  }
}
