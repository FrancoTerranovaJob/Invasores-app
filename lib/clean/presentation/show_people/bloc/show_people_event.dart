part of 'show_people_bloc.dart';

abstract class ShowPeopleEvent extends Equatable {
  const ShowPeopleEvent();
}

class ShowProfileEvent extends ShowPeopleEvent {
  final Character character;
  final List<Planet> planets;
  final List<Transport> transports;
  final bool offLineData;
  ShowProfileEvent(
      this.character, this.planets, this.transports, this.offLineData);

  @override
  List<Object?> get props => [character, planets, transports, offLineData];
}

class ReportCharacterEvent extends ShowPeopleEvent {
  @override
  List<Object?> get props => [];
}

class PageChangedEvent extends ShowPeopleEvent {
  final int page;

  PageChangedEvent({required this.page});
  @override
  List<Object?> get props => [page];
}

class StartAnimationPageEvent extends ShowPeopleEvent {
  @override
  List<Object?> get props => [];
}

class StopAnimationEvent extends ShowPeopleEvent {
  @override
  List<Object?> get props => [];
}
