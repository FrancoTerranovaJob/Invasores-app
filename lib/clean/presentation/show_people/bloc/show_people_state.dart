part of 'show_people_bloc.dart';

abstract class ShowPeopleState extends Equatable {
  final Character characterSelected;
  final List<Planet> planets;
  final List<Transport> transports;
  final bool offLineData;
  final int page;
  final bool enableReportButton;
  const ShowPeopleState(
      {required this.characterSelected,
      required this.planets,
      required this.transports,
      required this.offLineData,
      required this.page,
      required this.enableReportButton});
  @override
  List<Object> get props => [
        characterSelected,
        planets,
        transports,
        offLineData,
        page,
        enableReportButton
      ];
}

class ShowPeopleInitial extends ShowPeopleState {
  ShowPeopleInitial(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class CharacterProfileState extends ShowPeopleState {
  CharacterProfileState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class LoadingProfileState extends ShowPeopleState {
  LoadingProfileState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class PageChangedState extends ShowPeopleState {
  PageChangedState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class AnimatePageViewState extends ShowPeopleState {
  AnimatePageViewState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class StopAnimationState extends ShowPeopleState {
  StopAnimationState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class ReportSendState extends ShowPeopleState {
  ReportSendState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class ReportSendErrorState extends ShowPeopleState {
  ReportSendErrorState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}

class SendingReportState extends ShowPeopleState {
  SendingReportState(
      {required Character characterSelected,
      required List<Planet> planets,
      required List<Transport> transports,
      required bool offLineData,
      required int page,
      required bool enableReportButton})
      : super(
            characterSelected: characterSelected,
            planets: planets,
            transports: transports,
            offLineData: offLineData,
            page: page,
            enableReportButton: enableReportButton);
}
