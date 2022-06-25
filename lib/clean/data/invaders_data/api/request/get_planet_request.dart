import 'package:equatable/equatable.dart';

class GetPlanetRequest extends Equatable {
  final String url;

  GetPlanetRequest({required this.url});

  @override
  List<Object> get props => [url];
}