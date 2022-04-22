import 'package:equatable/equatable.dart';

class SetPlanetsRequest extends Equatable {
  final List<PlanetDB> planets;

  SetPlanetsRequest({required this.planets});

  @override
  List<Object?> get props => [planets];
}

class PlanetDB extends Equatable {
  final String id;
  final String name;

  PlanetDB({required this.name, required this.id});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['planet_id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [name, id];
}
