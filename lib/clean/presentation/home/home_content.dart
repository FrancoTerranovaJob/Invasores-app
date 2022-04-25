import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/drawer/bloc/lateral_drawer_bloc.dart';
import 'package:urbe_solution/clean/presentation/drawer/lateral_drawer_screen.dart';
import 'package:urbe_solution/clean/presentation/home/bloc/home_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/pages/change_mode_dialog_content.dart';
import 'package:urbe_solution/clean/presentation/home/pages/people_list_content.dart';
import 'package:urbe_solution/clean/presentation/home/pages/progress_content.dart';
import 'package:urbe_solution/widgets/dialog/view_dialog.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E4558),
      ),
      drawer: LateralDrawerScreen(onModeChanged: (value) async {
        if (value == true) {
          await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dContext) {
                return BlocProvider<LateralDrawerBloc>.value(
                  value: BlocProvider.of<LateralDrawerBloc>(context),
                  child: ChangeModeDialogContent(
                    onConfirm: (syncData) {
                      BlocProvider.of<HomeBloc>(context)
                          .add(ChangeModeEvent(true));
                      Navigator.pop(context);
                      if (syncData) {
                        BlocProvider.of<HomeBloc>(context).add(SyncDataEvent());
                      } else {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ChangeModeEvent(true));
                      }
                    },
                    onCancel: () {
                      BlocProvider.of<LateralDrawerBloc>(context)
                          .add(DrawerChangeModeEvent());
                      Navigator.pop(context);
                    },
                  ),
                );
              });
        } else {
          BlocProvider.of<HomeBloc>(context).add(ChangeModeEvent(false));
        }
      }, onSyncPressed: () async {
        Navigator.pop(context);
        BlocProvider.of<HomeBloc>(context).add(SyncDataEvent());
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
