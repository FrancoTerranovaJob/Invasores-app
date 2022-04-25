import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lateral_drawer_event.dart';
part 'lateral_drawer_state.dart';

class LateralDrawerBloc extends Bloc<LateralDrawerEvent, LateralDrawerState> {
  LateralDrawerBloc()
      : super(const LateralDrawerInitial(syncEnabled: false, isOnline: false)) {
    on<SyncDataEvent>((event, emit) {
      emit(NotifyState(
          isOnline: state.isOnline,
          syncEnabled: state.syncEnabled,
          syncPressed: true));
    });
    on<ChangeModeEvent>((event, emit) {
      emit(NotifyState(
          isOnline: !state.isOnline,
          syncEnabled: !state.syncEnabled,
          syncPressed: false,
          modeChanged: true));
    });
  }
}
