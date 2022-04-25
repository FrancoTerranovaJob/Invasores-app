part of 'lateral_drawer_bloc.dart';

abstract class LateralDrawerEvent extends Equatable {
  const LateralDrawerEvent();
}

class DrawerChangeModeEvent extends LateralDrawerEvent {
  DrawerChangeModeEvent();
  @override
  List<Object?> get props => [];
}

class DrawerSyncDataEvent extends LateralDrawerEvent {
  @override
  List<Object?> get props => [];
}

class InitializeDrawerEvent extends LateralDrawerEvent {
  @override
  List<Object?> get props => [];
}
