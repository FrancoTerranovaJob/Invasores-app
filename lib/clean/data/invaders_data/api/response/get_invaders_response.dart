import 'package:equatable/equatable.dart';

import 'invader_response.dart';

class GetInvadersResponse extends Equatable {
  final List<InvaderResponse> characters;
  final String? nextPageUrl;
  const GetInvadersResponse(
      {required this.characters, required this.nextPageUrl});

  factory GetInvadersResponse.fromJson(Map<String, dynamic> data) {
    final invadersList = List<Map<String, dynamic>>.from(data['results']);

    return GetInvadersResponse(
        characters: invadersList
            .map((invader) => InvaderResponse.fromJson(invader))
            .toList(),
        nextPageUrl: data['next']);
  }
  @override
  List<Object?> get props => [characters];
}