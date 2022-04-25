part of 'lateral_drawer_bloc.dart';

abstract class LateralDrawerEvent extends Equatable {
  const LateralDrawerEvent();
}

class ChangeModeEvent extends LateralDrawerEvent {
  ChangeModeEvent();
  @override
  List<Object?> get props => [];
}

class SyncDataEvent extends LateralDrawerEvent {
  @override
  List<Object?> get props => [];
}
