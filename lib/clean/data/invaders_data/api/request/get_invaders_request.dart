import 'package:equatable/equatable.dart';

class GetInvadersRequest extends Equatable {
  final String? nextPageUrl;

  const GetInvadersRequest({this.nextPageUrl});

  @override
  List<Object?> get props => [nextPageUrl];
}
