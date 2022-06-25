import 'package:equatable/equatable.dart';

class GetVehicleRequest extends Equatable {
  final String url;

  GetVehicleRequest({required this.url});

  @override
  List<Object> get props => [url];
}