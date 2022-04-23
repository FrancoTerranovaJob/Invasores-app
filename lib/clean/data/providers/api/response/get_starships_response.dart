import 'package:equatable/equatable.dart';

class GetStarShipsResponse extends Equatable {
  final List<StarShipResponse> starships;
  final String? nextPageUrl;

  factory GetStarShipsResponse.fromJson(Map<String, dynamic> data) {
    final strships = <StarShipResponse>[];
    for (var star in data['results']) {
      strships.add(StarShipResponse(id: star['url'], name: star['name']));
    }
    return GetStarShipsResponse(starships: strships, nextPageUrl: data['next']);
  }

  GetStarShipsResponse({required this.starships, required this.nextPageUrl});

  @override
  List<Object?> get props => [starships, nextPageUrl];
}

class StarShipResponse extends Equatable {
  final String id;
  final String name;

  StarShipResponse({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
