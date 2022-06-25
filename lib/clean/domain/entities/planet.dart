import 'package:equatable/equatable.dart';

class Planet extends Equatable {
  final String id;
  final String name;

  Planet({required this.name, required this.id});

  factory Planet.fromString({required String id}) {
    return Planet(name: '', id: id);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  @override
  List<Object?> get props => [name];
}