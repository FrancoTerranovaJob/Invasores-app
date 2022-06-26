import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/data/invaders_data/api/response/get_invaders_response.dart';

import 'invader.dart';

class InvadersList extends Equatable {
  final List<Invader> invaders;
  final String? nextPage;
  final int currentPage;

  const InvadersList(
      {this.invaders = const [], this.nextPage, this.currentPage = 0});

  @override
  List<Object?> get props => [invaders, currentPage];
}