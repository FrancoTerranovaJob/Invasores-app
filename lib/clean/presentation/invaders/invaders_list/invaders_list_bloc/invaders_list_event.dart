part of 'invaders_list_bloc.dart';

abstract class InvadersListEvent extends Equatable {
  const InvadersListEvent();
}

class GetInvadersEvent extends InvadersListEvent {
  @override
  List<Object> get props => [];
}

class NextPageEvent extends InvadersListEvent {
  @override
  List<Object> get props => [];
}

class PreviousPageEvent extends InvadersListEvent {
  @override
  List<Object> get props => [];
}
