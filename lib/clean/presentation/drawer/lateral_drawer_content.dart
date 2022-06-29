import 'package:InvadersApp/clean/presentation/drawer/bloc/lateral_drawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              Theme.of(context).colorScheme.primary.withOpacity(0.85),
          child: Container(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.50),
            child: ListView(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: DrawerHeader(
                    child: Center(
                        child: Text(
                      'Invasores',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    )),
                  ),
                ),
                BlocBuilder<LateralDrawerBloc, LateralDrawerState>(
                    builder: (context, state) {
                  return ListTile(
                      enabled: state.isOnline,
                      leading: Icon(
                        Icons.signal_wifi_4_bar_rounded,
                        color: state.isOnline
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.25),
                      ),
                      title: Text(
                        'Modo online',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      trailing: Switch(
                          activeColor:
                              Theme.of(context).colorScheme.onBackground,
                          value: state.isOnline,
                          onChanged: (value) {
                            BlocProvider.of<LateralDrawerBloc>(context)
                                .add(DrawerChangeModeEvent());
                          }));
                }),
                BlocBuilder<LateralDrawerBloc, LateralDrawerState>(
                  builder: (context, state) {
                    return ListTile(
                      enabled: state.syncEnabled,
                      leading: Icon(
                        Icons.sync,
                        color: state.isOnline
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.25),
                      ),
                      title: Text(
                        'Sincronizar datos',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                        'Trae nuevamente todos los datos disponibles.',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      onTap: () {
                        BlocProvider.of<LateralDrawerBloc>(context)
                            .add(DrawerSyncDataEvent());
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
