part of 'core_bloc.dart';

abstract class CoreEvent extends Equatable {
  const CoreEvent();
}

class InitializeAppEvent extends CoreEvent {
  @override
  List<Object?> get props => [];
}

class InitializedAppEvent extends CoreEvent {
  @override
  List<Object?> get props => [];
}
