import 'package:equatable/equatable.dart';

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