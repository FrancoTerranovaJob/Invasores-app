import 'package:equatable/equatable.dart';

class GetStarShipsResponse extends Equatable {
  final List<StarShipResponse> starships;
  final String? nextPageUrl;

  factory GetStarShipsResponse.fromJson(Map<String, dynamic> data) {
    final strships = <StarShipResponse>[];
    for (var star in data['results']) {
      strships.add(StarShipResponse(
          id: star['url'],
          name: star['name'],
          pilotsId: List<String>.from(star['pilots'] as List)));
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
  final List<String> pilotsId;

  StarShipResponse(
      {required this.id, required this.name, required this.pilotsId});

  @override
  List<Object?> get props => [id, name, pilotsId];
}
