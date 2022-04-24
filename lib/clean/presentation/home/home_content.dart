import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/pages/progress_content.dart';
import 'package:urbe_solution/widgets/people_card/people_card.dart';
import 'package:urbe_solution/widgets/progress/progress.dart';

import '../../domain/entities/character.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E4558),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (p, c) =>
                (c is LoadingState || c is DataState || c is ErrorState),
            builder: (bContext, state) {
              if (state is LoadingState) {
                return ProgressPage();
              } else if (state is DataState) {
                final cards =
                    List.generate(state.data.characters.length, (index) {
                  return PeopleCard<Character>(
                      item: state.data.characters[index],
                      head: (char) {
                        return Container(
                          color: Color(0xFF9F0613),
                        );
                      },
                      body: (char) {
                        return Container(
                          color: Color(0xFFE89E10),
                        );
                      });
                });
                return Container(
                  color: Color(0xFF2E4558),
                  child: Column(
                    children: [
                      Expanded(
                          child: GridView.count(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 2,
                        children: cards,
                      )),
                    ],
                  ),
                );
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
