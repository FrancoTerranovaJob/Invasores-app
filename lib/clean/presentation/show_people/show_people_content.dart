import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/bloc/show_people_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/profile_page/profile_page.dart';
import 'package:urbe_solution/clean/presentation/show_people/pages/progress_content.dart';
import 'package:urbe_solution/theme/app_theme.dart';

class ShowPeopleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.mainTheme(context).colorScheme.primary,
        elevation: 0,
      ),
      backgroundColor: Themes.mainTheme(context).colorScheme.primary,
      body: SafeArea(
          child: BlocBuilder<ShowPeopleBloc, ShowPeopleState>(
              buildWhen: (p, c) =>
                  (c is CharacterProfileState || c is LoadingProfileState),
              builder: (context, state) {
                if (state is CharacterProfileState) {
                  return ProfilePage();
                }
                if (state is LoadingProfileState) {
                  return ProgressContent();
                } else {
                  return Container();
                }
              })),
    );
  }
}
