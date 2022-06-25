import 'package:equatable/equatable.dart';

class GetStarshipRequest extends Equatable {
  final String url;

  GetStarshipRequest({required this.url});

  @override
  List<Object> get props => [url];
}