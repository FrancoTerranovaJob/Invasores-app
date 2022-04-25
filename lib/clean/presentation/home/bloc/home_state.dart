part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final ConsolidatedData data;
  final bool showDrawer;

  const HomeState({required this.data, required this.showDrawer});
  @override
  List<Object> get props => [data, showDrawer];
}

class HomeInitial extends HomeState {
  HomeInitial({required ConsolidatedData data, required bool showDrawer})
      : super(data: data, showDrawer: showDrawer);
}

class LoadingState extends HomeState {
  LoadingState({required ConsolidatedData data, required bool showDrawer})
      : super(data: data, showDrawer: showDrawer);
}

class DataState extends HomeState {
  DataState({required ConsolidatedData data, required bool showDrawer})
      : super(data: data, showDrawer: showDrawer);
}

class ErrorState extends HomeState {
  ErrorState({required ConsolidatedData data, required bool showDrawer})
      : super(data: data, showDrawer: showDrawer);
}

class ShowDrawerState extends HomeState {
  ShowDrawerState({required ConsolidatedData data, required bool showDrawer})
      : super(data: data, showDrawer: showDrawer);
}
