import 'package:equatable/equatable.dart';

class GetPlanetsResponse extends Equatable {
  final List<PlanetResponse> planets;
  final String? nextPageUrl;

  GetPlanetsResponse({required this.planets, required this.nextPageUrl});

  factory GetPlanetsResponse.fromJson(Map<String, dynamic> data) {
    final plnets = <PlanetResponse>[];
    for (var plnts in data['results']) {
      plnets.add(PlanetResponse(id: plnts['url'], name: plnts['name']));
    }
    return GetPlanetsResponse(planets: plnets, nextPageUrl: data['next']);
  }
  @override
  List<Object?> get props => [planets, nextPageUrl];
}

class PlanetResponse extends Equatable {
  final String id;
  final String name;

  PlanetResponse({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
