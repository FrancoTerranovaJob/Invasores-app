part of 'lateral_drawer_bloc.dart';

abstract class LateralDrawerState extends Equatable {
  final bool isOnline;
  final bool syncEnabled;

  const LateralDrawerState({required this.isOnline, required this.syncEnabled});
  @override
  List<Object> get props => [isOnline, syncEnabled];
}

class LateralDrawerInitial extends LateralDrawerState {
  const LateralDrawerInitial(
      {required bool isOnline, required bool syncEnabled})
      : super(isOnline: isOnline, syncEnabled: syncEnabled);
}

class NotifyState extends LateralDrawerState {
  final bool syncPressed;
  final bool modeChanged;
  const NotifyState(
      {required bool isOnline,
      required bool syncEnabled,
      this.modeChanged = false,
      this.syncPressed = false})
      : super(isOnline: isOnline, syncEnabled: syncEnabled);
}
