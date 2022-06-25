import 'package:equatable/equatable.dart';

class VehicleResponse extends Equatable {
  final String id;
  final String name;

  VehicleResponse({required this.id, required this.name});

  factory VehicleResponse.fromJson(Map<String, dynamic> data) {
    return VehicleResponse(
      id: data['url'],
      name: data['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}