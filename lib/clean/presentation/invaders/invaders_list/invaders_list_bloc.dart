import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/domain/entities/invaders_list.dart';

part 'invaders_list_event.dart';
part 'invaders_list_state.dart';

class InvadersListBloc extends Bloc<InvadersListEvent, InvadersListState> {
  InvadersListBloc() : super(InvadersListState()) {
    on<InvadersListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}