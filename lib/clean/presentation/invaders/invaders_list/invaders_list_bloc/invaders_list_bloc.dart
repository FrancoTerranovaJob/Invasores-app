import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../di/kiwi.dart';
import '../../../../domain/entities/invaders_list.dart';
import '../../../../domain/invaders_domain/use_cases/invaders_use_cases.dart';
part 'invaders_list_event.dart';
part 'invaders_list_state.dart';

class InvadersListBloc extends Bloc<InvadersListEvent, InvadersListState> {
  final getInvadersUseCase = services.resolve<GetInvadersDataUseCase>();
  InvadersListBloc() : super(InvadersListState()) {
    on<GetInvadersEvent>(_getInvadersEvent);
  }

  void _getInvadersEvent(
      GetInvadersEvent event, Emitter<InvadersListState> emit) async {
    emit(state.copyWith(invaderStatus: InvadersStatus.loading));
    final response = await getInvadersUseCase.call(state.invadersList);
    emit(state.copyWith(
        invaderStatus: InvadersStatus.data, invadersList: response));
  }
}