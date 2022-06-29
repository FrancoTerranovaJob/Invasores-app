import 'package:equatable/equatable.dart';

import 'invader.dart';

class InvadersList extends Equatable {
  final List<Invader> invaders;
  final String? nextPage;
  final int currentPage;

  const InvadersList(
      {this.invaders = const [], this.nextPage, this.currentPage = 0});

  factory InvadersList.fromDataBase(
      Map<dynamic, dynamic> json, bool hasNextPage) {
    final invaders = List<Map<dynamic, dynamic>>.from(json['invadersList']);

    return InvadersList(
        invaders:
            invaders.map((invader) => Invader.fromDataBase(invader)).toList(),
        nextPage: hasNextPage ? json['nextPage'] : null,
        currentPage: json['currentPage']);
  }
  Map<String, dynamic> toJson() {
    return {
      'nextPage': nextPage,
      'currentPage': currentPage,
      'invadersList': invaders.map((invaders) => invaders.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [invaders, currentPage];
}