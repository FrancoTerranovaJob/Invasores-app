part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ShowDrawerEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SyncDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeModeEvent extends HomeEvent {
  final bool newValue;

  ChangeModeEvent(this.newValue);
  @override
  List<Object?> get props => [newValue];
}

class FilterSelectedEvent extends HomeEvent {
  final GenderType gender;

  FilterSelectedEvent(this.gender);
  @override
  List<Object?> get props => [gender];
}

class FilterDeselectedEvent extends HomeEvent {
  FilterDeselectedEvent();
  @override
  List<Object?> get props => [];
}
