import 'package:equatable/equatable.dart';

enum TransportType { starship, vehicle }

class Transport extends Equatable {
  final String id;
  final String name;
  final TransportType type;

  Transport({required this.name, required this.type, required this.id});

  @override
  List<Object?> get props => [name, type];
}
