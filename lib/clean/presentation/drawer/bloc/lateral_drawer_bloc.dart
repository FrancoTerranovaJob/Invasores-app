import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';

import '../../../domain/user_domain/use_cases/user_use_cases.dart';

part 'lateral_drawer_event.dart';
part 'lateral_drawer_state.dart';

class LateralDrawerBloc extends Bloc<LateralDrawerEvent, LateralDrawerState> {
  final GetModeUseCase getModeUseCase;
  LateralDrawerBloc({required this.getModeUseCase})
      : super(const LateralDrawerInitial(syncEnabled: false, isOnline: false)) {
    on<InitializeDrawerEvent>((event, emit) async {
      final isOnline = await getModeUseCase.call();
      emit(IdleState(isOnline: isOnline, syncEnabled: isOnline));
    });
    on<DrawerSyncDataEvent>((event, emit) {
      emit(NotifyState(
          isOnline: state.isOnline,
          syncEnabled: state.syncEnabled,
          syncPressed: true));
      emit(IdleState(isOnline: state.isOnline, syncEnabled: state.syncEnabled));
    });
    on<DrawerChangeModeEvent>((event, emit) {
      emit(NotifyState(
          isOnline: !state.isOnline,
          syncEnabled: !state.syncEnabled,
          syncPressed: false,
          modeChanged: true));
      emit(IdleState(isOnline: state.isOnline, syncEnabled: state.syncEnabled));
    });
  }
}
