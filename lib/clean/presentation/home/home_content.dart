import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/drawer/lateral_drawer_screen.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/pages/people_list_content.dart';
import 'package:urbe_solution/clean/presentation/home/pages/progress_content.dart';
import 'package:urbe_solution/widgets/people_card/people_card.dart';
import 'package:urbe_solution/widgets/progress/progress.dart';

import '../../../theme/app_theme.dart';
import '../../domain/entities/character.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E4558),
      ),
      drawer: LateralDrawerScreen(onModeChanged: (value) {
        BlocProvider.of<HomeBloc>(context).add(ChangeModeEvent());
      }, onSyncPressed: () {
        Navigator.pop(context);
        BlocProvider.of<HomeBloc>(context).add(LoadDataEvent());
      }),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (p, c) =>
                (c is LoadingState || c is DataState || c is ErrorState),
            builder: (bContext, state) {
              if (state is LoadingState) {
                return ProgressPage();
              } else if (state is DataState) {
                return PeopleListContent(people: state.data.characters);

                return Container(
                  color: Colors.green,
                );
              } else if (state is ErrorState) {
                return Container(
                  color: Colors.purple,
                );
              } else {
                return Container(
                  color: Colors.blue,
                );
              }
            }),
      ),
    );
  }
}
