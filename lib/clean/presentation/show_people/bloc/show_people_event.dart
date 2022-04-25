part of 'show_people_bloc.dart';

abstract class ShowPeopleEvent extends Equatable {
  const ShowPeopleEvent();
}

class ShowProfileEvent extends ShowPeopleEvent {
  final Character character;
  final List<Planet> planets;
  final List<Transport> transports;

  ShowProfileEvent(this.character, this.planets, this.transports);

  @override
  List<Object?> get props => [character, planets, transports];
}

class ReportCharacterEvent extends ShowPeopleEvent {
  @override
  List<Object?> get props => [];
}
