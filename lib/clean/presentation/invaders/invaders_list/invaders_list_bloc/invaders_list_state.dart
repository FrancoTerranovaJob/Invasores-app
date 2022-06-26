part of 'invaders_list_bloc.dart';

enum InvadersStatus { loading, data, error, initial }

class InvadersListState extends Equatable {
  final InvadersStatus invaderStatus;
  final InvadersList invadersList;

  const InvadersListState(
      {this.invaderStatus = InvadersStatus.initial,
      this.invadersList = const InvadersList()});

  InvadersListState copyWith({
    InvadersStatus? invaderStatus,
    InvadersList? invadersList,
  }) {
    return InvadersListState(
        invaderStatus: invaderStatus ?? this.invaderStatus,
        invadersList: invadersList ?? this.invadersList);
  }

  @override
  List<Object> get props => [invaderStatus, invadersList];
}