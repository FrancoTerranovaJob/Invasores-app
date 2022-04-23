import 'package:equatable/equatable.dart';

class Planet extends Equatable {
  final String id;
  final String name;

  Planet({required this.name, required this.id});
  @override
  List<Object?> get props => [name];
}
