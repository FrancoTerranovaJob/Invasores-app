part of 'invaders_list_bloc.dart';

enum InvadersStatus { loading, data, error, initial }

class InvadersListState extends Equatable {
  final InvadersStatus invaderStatus;
  final InvadersList invadersList;
  final Map<int, List<Invader>> paginatedList;
  final int currentPage;
  final bool enablePreviousButton;
  final bool enableNextButton;

  const InvadersListState(
      {this.invaderStatus = InvadersStatus.initial,
      this.invadersList = const InvadersList(),
      this.paginatedList = const {},
      this.currentPage = -1,
      this.enablePreviousButton = false,
      this.enableNextButton = true});

  InvadersListState copyWith({
    InvadersStatus? invaderStatus,
    InvadersList? invadersList,
    Map<int, List<Invader>>? paginatedList,
    int? currentPage,
    bool? enablePreviousButton,
    bool? enableNextButton,
  }) {
    return InvadersListState(
        invaderStatus: invaderStatus ?? this.invaderStatus,
        invadersList: invadersList ?? this.invadersList,
        paginatedList: paginatedList ?? this.paginatedList,
        currentPage: currentPage ?? this.currentPage,
        enableNextButton: enableNextButton ?? this.enableNextButton,
        enablePreviousButton:
            enablePreviousButton ?? this.enablePreviousButton);
  }

  @override
  List<Object> get props => [
        invaderStatus,
        invadersList,
        paginatedList,
        currentPage,
        enablePreviousButton,
        enableNextButton
      ];
}