import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/home/pages/people_list_content.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/filter/filter_list.dart';
import '../../../domain/entities/character.dart';
import '../../drawer/bloc/lateral_drawer_bloc.dart';
import '../../drawer/lateral_drawer_screen.dart';
import '../../show_people/show_people_screen.dart';
import '../bloc/home_bloc.dart';
import 'change_mode_dialog_content.dart';
import 'error_page.dart';

class DataContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.mainTheme(context).colorScheme.primary,
        appBar: AppBar(
          elevation: 0,
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
                          BlocProvider.of<HomeBloc>(context)
                              .add(SyncDataEvent());
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Themes.mainTheme(context).colorScheme.primary,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (p, c) =>
                        c is FilterSelectedState || c is FilterDeselectedState,
                    builder: (context, state) {
                      return FilterList<GenderType>(
                        items: [
                          GenderType.male,
                          GenderType.female,
                          GenderType.unknown,
                          GenderType.na,
                        ],
                        onItemSelected: (item) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(FilterSelectedEvent(item));
                        },
                        isSelected: (item) {
                          return state is FilterSelectedState
                              ? item == state.filterSelected
                              : false;
                        },
                        parseText: (item) => _parseGender(item),
                        onItemDeselected: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(FilterDeselectedEvent());
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (p, c) =>
                        c is ErrorState ||
                        c is DataState ||
                        c is SyncErrorState ||
                        c is FilterSelectedState ||
                        c is FilterDeselectedState,
                    builder: (context, state) {
                      if (state is DataState ||
                          state is SyncErrorState ||
                          state is FilterSelectedState ||
                          state is FilterDeselectedState) {
                        return PeopleListContent(
                          people: state is FilterSelectedState
                              ? state.filteredChars!
                              : state.data.characters,
                          onCardPressed: (char) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ShowPeopleScreen(
                                      character: char,
                                      planets: state.data.planets,
                                      transports: state.data.transports,
                                      offLineData: state.data.isOnline,
                                    )));
                          },
                        );
                      } else if (state is ErrorState) {
                        return ErrorPage();
                      } else {
                        return Container();
                      }
                    }),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: 50,
                        child: Container(
                            color:
                                Themes.mainTheme(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.adjust_rounded,
                                    color: state.isOnline
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.isOnline ? 'Online' : 'Offline',
                                      style: Themes.mainTheme(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Themes.mainTheme(context)
                                                  .colorScheme
                                                  .onBackground),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  );
                },
              ),
            ],
          ),
        ));
  }

  String _parseGender(GenderType gender) {
    switch (gender) {
      case GenderType.male:
        return 'Masculino';
      case GenderType.female:
        return 'Femenino';
      case GenderType.unknown:
        return 'Desconocido';
      case GenderType.na:
        return 'Sin genero';
    }
  }
}
