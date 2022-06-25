import 'package:equatable/equatable.dart';

class StarShipResponse extends Equatable {
  final String id;
  final String name;

  StarShipResponse({required this.id, required this.name});

  factory StarShipResponse.fromJson(Map<String, dynamic> data) {
    return StarShipResponse(
      id: data['url'],
      name: data['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}