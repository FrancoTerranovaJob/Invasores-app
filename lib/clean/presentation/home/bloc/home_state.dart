part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final ConsolidatedData data;
  final bool showDrawer;
  final bool isOnline;
  const HomeState(
      {required this.data, required this.showDrawer, required this.isOnline});
  @override
  List<Object> get props => [data, showDrawer, isOnline];
}

class HomeInitial extends HomeState {
  HomeInitial(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class LoadingState extends HomeState {
  LoadingState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class DataState extends HomeState {
  DataState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class ErrorState extends HomeState {
  ErrorState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class ShowDrawerState extends HomeState {
  ShowDrawerState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class ChangeModeDisplayState extends HomeState {
  ChangeModeDisplayState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}

class SyncErrorState extends HomeState {
  SyncErrorState(
      {required ConsolidatedData data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data, showDrawer: showDrawer, isOnline: isOnline);
}
