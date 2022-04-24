part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final ConsolidatedData data;

  const HomeState({required this.data});
  @override
  List<Object> get props => [data];
}

class HomeInitial extends HomeState {
  HomeInitial({required ConsolidatedData data}) : super(data: data);
}

class LoadingState extends HomeState {
  LoadingState({required ConsolidatedData data}) : super(data: data);
}

class DataState extends HomeState {
  DataState({required ConsolidatedData data}) : super(data: data);
}

class ErrorState extends HomeState {
  ErrorState({required ConsolidatedData data}) : super(data: data);
}
