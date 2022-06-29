import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/user_domain/use_cases/user_use_cases.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final InitializeAppUseCase initializeUseCase;
  CoreBloc({required this.initializeUseCase}) : super(CoreInitial()) {
    on<InitializeAppEvent>((event, emit) async {
      emit(InitializeAppState());
      await initializeUseCase.call();

      add(InitializedAppEvent());
    });
    on<InitializedAppEvent>((event, emit) async {
      emit(InitializedAppState());
    });
  }
}
