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
  factory Transport.fromString(
      {required String id, required TransportType transportType}) {
    return Transport(name: '', type: transportType, id: id);
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