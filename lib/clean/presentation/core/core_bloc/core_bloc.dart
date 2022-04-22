import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/use_cases/initialize_app_use_case.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final initializeUseCase = KiwiContainer().resolve<InitializeAppUseCase>();
  CoreBloc() : super(CoreInitial()) {
    on<InitializeAppEvent>((event, emit) async {
      emit(InitializedAppState());
      await initializeUseCase.call();
      add(InitializedAppEvent());
    });
    on<InitializedAppEvent>((event, emit) async {
      emit(InitializedAppState());
    });
  }
}
