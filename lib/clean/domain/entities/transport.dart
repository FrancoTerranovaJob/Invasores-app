import 'package:equatable/equatable.dart';

enum TransportType { starship, vehicle }

class Transport extends Equatable {
  final String id;
  final String name;
  final TransportType type;

  Transport({
    required this.name,
    required this.type,
    required this.id,
  });
  factory Transport.vehicleFromId({required String id}) {
    return Transport(name: '', type: TransportType.vehicle, id: id);
  }

  factory Transport.starshipFromId({required String id}) {
    return Transport(name: '', type: TransportType.starship, id: id);
  }

  factory Transport.fromDataBase(Map<dynamic, dynamic> json) {
    return Transport(
        name: json['name'],
        type: 'vehicle' == json['type']
            ? TransportType.vehicle
            : TransportType.starship,
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': TransportType.vehicle == type ? 'vehicle' : 'starship'
    };
  }

  @override
  List<Object?> get props => [name, type];
}