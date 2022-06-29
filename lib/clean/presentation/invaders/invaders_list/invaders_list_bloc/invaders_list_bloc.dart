import 'package:InvadersApp/clean/domain/entities/entities.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../di/kiwi.dart';

import '../../../../domain/invaders_domain/use_cases/invaders_use_cases.dart';
part 'invaders_list_event.dart';
part 'invaders_list_state.dart';

class InvadersListBloc extends Bloc<InvadersListEvent, InvadersListState> {
  final getInvadersUseCase = services.resolve<GetInvadersDataUseCase>();
  InvadersListBloc() : super(InvadersListState()) {
    on<GetInvadersEvent>(_getInvadersEvent);
    on<NextPageEvent>(_nextPageEvent);
    on<PreviousPageEvent>(_previousPageEvent);
  }

  void _getInvadersEvent(
      GetInvadersEvent event, Emitter<InvadersListState> emit) async {
    emit(state.copyWith(invaderStatus: InvadersStatus.loading));
    final response = await getInvadersUseCase.call(state.invadersList);
    final paginatedList = <int, List<Invader>>{};
    paginatedList.addAll(state.paginatedList);
    paginatedList[state.currentPage] = response.invaders;
    emit(state.copyWith(
        invaderStatus: InvadersStatus.data,
        invadersList: response,
        paginatedList: paginatedList));
  }

  void _nextPageEvent(
      NextPageEvent event, Emitter<InvadersListState> emit) async {
    if (!state.paginatedList.containsKey(state.currentPage + 1)) {
      emit(state.copyWith(invaderStatus: InvadersStatus.loading));
      final response = await getInvadersUseCase.call(state.invadersList);
      final paginatedList = <int, List<Invader>>{};
      paginatedList.addAll(state.paginatedList);
      paginatedList[state.currentPage + 1] = response.invaders;
      emit(state.copyWith(
          invaderStatus: InvadersStatus.data,
          invadersList: response,
          paginatedList: paginatedList,
          currentPage: state.currentPage + 1));
    } else {
      emit(state.copyWith(
        invadersList: InvadersList(
            invaders: state
                .paginatedList[state.paginatedList[state.currentPage + 1]]!,
            nextPage: state.invadersList.nextPage,
            currentPage: state.currentPage + 1),
      ));
    }
  }

  void _previousPageEvent(
      PreviousPageEvent event, Emitter<InvadersListState> emit) {
    emit(state.copyWith(
      invadersList: InvadersList(
          invaders: state.paginatedList[state.currentPage - 1]!,
          nextPage: state.invadersList.nextPage,
          currentPage: state.currentPage - 1),
    ));
  }
}
