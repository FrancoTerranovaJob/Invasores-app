import 'package:InvadersApp/clean/domain/entities/entities.dart';
import 'package:InvadersApp/clean/domain/invaders_domain/use_cases/use_cases.dart';
import 'package:InvadersApp/di/kiwi.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'invaders_list_event.dart';
part 'invaders_list_state.dart';

class InvadersListBloc extends Bloc<InvadersListEvent, InvadersListState> {
  final getInvadersUseCase = services.resolve<GetInvadersDataUseCase>();
  InvadersListBloc() : super(InvadersListState()) {
    on<NextPageEvent>(_nextPageEvent);
    on<PreviousPageEvent>(_previousPageEvent);
  }

  void _nextPageEvent(
      NextPageEvent event, Emitter<InvadersListState> emit) async {
    int currentPage = state.currentPage + 1;
    if (!state.paginatedList.containsKey(currentPage)) {
      emit(state.copyWith(invaderStatus: InvadersStatus.loading));

      emit(await _getInvaderList());
    } else {
      emit(
        state.copyWith(
            invadersList: InvadersList(
                invaders: state.paginatedList[currentPage]!,
                nextPage: state.invadersList.nextPage,
                currentPage: state.invadersList.currentPage),
            currentPage: currentPage,
            enablePreviousButton: currentPage > 0,
            enableNextButton: state.invadersList.nextPage != null ||
                state.paginatedList.containsKey(currentPage + 1)),
      );
    }
  }

  void _previousPageEvent(
      PreviousPageEvent event, Emitter<InvadersListState> emit) {
    int previousPage = state.currentPage - 1;
    emit(state.copyWith(
        invadersList: InvadersList(
            invaders: state.paginatedList[previousPage]!,
            nextPage: state.invadersList.nextPage,
            currentPage: state.invadersList.currentPage),
        currentPage: previousPage,
        enablePreviousButton: previousPage > 0,
        enableNextButton: true));
  }

  Future<InvadersListState> _getInvaderList() async {
    int currentPage = state.currentPage + 1;
    final response = await getInvadersUseCase.call(state.invadersList);
    final paginatedList = <int, List<Invader>>{}..addAll(state.paginatedList);

    paginatedList[currentPage] = response.invaders;
    return state.copyWith(
        invaderStatus: InvadersStatus.data,
        invadersList: response,
        paginatedList: paginatedList,
        currentPage: currentPage,
        enablePreviousButton: currentPage > 0,
        enableNextButton: response.nextPage != null);
  }
}