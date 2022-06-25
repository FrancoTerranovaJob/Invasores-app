import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbe_solution/clean/domain/entities/invader.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';
import 'package:urbe_solution/clean/presentation/show_people/bloc/show_people_bloc.dart';
import 'package:urbe_solution/clean/presentation/show_people/show_people_content.dart';

class ShowPeopleScreen extends StatelessWidget {
  final Character character;
  final List<Planet> planets;
  final List<Transport> transports;
  final bool offLineData;

  const ShowPeopleScreen(
      {Key? key,
      required this.character,
      required this.planets,
      required this.transports,
      required this.offLineData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowPeopleBloc()
        ..add(ShowProfileEvent(character, planets, transports, offLineData)),
      child: ShowPeopleContent(),
    );
  }
}