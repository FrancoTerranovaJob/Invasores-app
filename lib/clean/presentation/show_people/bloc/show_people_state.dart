part of 'show_people_bloc.dart';

abstract class ShowPeopleState extends Equatable {
  final Character characterSelected;
  final List<Planet> planets;
  final List<Transport> transports;
  const ShowPeopleState(
      {required this.characterSelected,
      required this.planets,
      required this.transports});
  @override
  List<Object> get props => [characterSelected, planets, transports];
}

class ShowPeopleInitial extends ShowPeopleState {
  ShowPeopleInitial(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports);
}

class CharacterProfileState extends ShowPeopleState {
  CharacterProfileState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports);
}

class LoadingProfileState extends ShowPeopleState {
  LoadingProfileState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports);
}
