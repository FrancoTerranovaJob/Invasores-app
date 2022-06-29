import 'package:equatable/equatable.dart';

class PlanetResponse extends Equatable {
  final String id;
  final String name;

  PlanetResponse({required this.id, required this.name});

  factory PlanetResponse.fromJson(Map<String, dynamic> data) {
    return PlanetResponse(id: data['url'], name: data['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
