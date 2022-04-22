import 'package:equatable/equatable.dart';

class GetConsolidatedCharacters extends Equatable {
  final Map<String, dynamic> characters;
  const GetConsolidatedCharacters({required this.characters});
  @override
  List<Object?> get props => [characters];
}
