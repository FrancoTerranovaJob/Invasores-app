import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/presentation/drawer/bloc/lateral_drawer_bloc.dart';
import 'package:urbe_solution/theme/app_theme.dart';

class LateralDrawerContent extends StatelessWidget {
  final Function(bool isOnline) onModeChanged;
  final Function() onSyncPressed;

  const LateralDrawerContent(
      {Key? key, required this.onModeChanged, required this.onSyncPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<LateralDrawerBloc, LateralDrawerState>(
              listenWhen: (p, c) => c is NotifyState,
              listener: (context, state) {
                if (state is NotifyState) {
                  if (state.syncPressed) {
                    onSyncPressed();
                  } else if (state.modeChanged) {
                    onModeChanged(state.isOnline);
                  }
                }
              })
        ],
        child: Drawer(
          backgroundColor:
              Themes.mainTheme(context).colorScheme.primary.withOpacity(0.85),
          child: Container(
            color: Themes.mainTheme(context)
                .colorScheme
                .onBackground
                .withOpacity(0.50),
            child: ListView(
              children: [
                Container(
                  color: Themes.mainTheme(context).colorScheme.primary,
                  child: DrawerHeader(
                    child: Center(
                        child: Text(
                      'Invasores',
                      style: Themes.mainTheme(context)
                          .textTheme
                          .headline1!
                          .copyWith(
                              color: Themes.mainTheme(context)
                                  .colorScheme
                                  .onBackground),
                    )),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.signal_wifi_4_bar_rounded,
                    color: Themes.mainTheme(context).colorScheme.background,
                  ),
                  title: Text(
                    'Modo online',
                    style: Themes.mainTheme(context).textTheme.headline2,
                  ),
                  trailing: BlocBuilder<LateralDrawerBloc, LateralDrawerState>(
                    builder: (context, state) {
                      return Switch(
                          activeColor: Themes.mainTheme(context)
                              .colorScheme
                              .onBackground,
                          value: state.isOnline,
                          onChanged: (value) {
                            BlocProvider.of<LateralDrawerBloc>(context)
                                .add(ChangeModeEvent());
                          });
                    },
                  ),
                ),
                BlocBuilder<LateralDrawerBloc, LateralDrawerState>(
                  builder: (context, state) {
                    return ListTile(
                      enabled: state.syncEnabled,
                      leading: Icon(
                        Icons.sync,
                      ),
                      title: Text('Sync Data'),
                      onTap: () {
                        BlocProvider.of<LateralDrawerBloc>(context)
                            .add(SyncDataEvent());
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
