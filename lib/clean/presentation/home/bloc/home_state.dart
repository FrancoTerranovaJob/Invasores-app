part of 'home_bloc.dart';



abstract class HomeState extends Equatable {
  final InvadersList data;
  final HomeStatus status;
  final GenderType? filterSelected;
  final List<Invader> filteredChars;
  const HomeState(
      {required this.data, required this.status, this.filterSelected, this.filteredChars = const []});
  @override
  List<Object?> get props => [data, filteredChars, filterSelected,status];
}

class HomeBlocState extends HomeState {

  HomeBlocState.loading() : super()
  HomeInitial(
      {required InvadersList data,
      required bool showDrawer,
      required bool isOnline})
      : super(data: data);
}