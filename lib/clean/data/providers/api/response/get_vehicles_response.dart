import 'package:equatable/equatable.dart';

class GetVehiclesResponse extends Equatable {
  final List<VehicleResponse> vehicles;
  final String? nextPageUrl;

  factory GetVehiclesResponse.fromJson(Map<String, dynamic> data) {
    final vehcls = <VehicleResponse>[];
    for (var veh in data['results']) {
      vehcls.add(VehicleResponse(id: veh['url'], name: veh['name']));
    }
    return GetVehiclesResponse(vehicles: vehcls, nextPageUrl: data['next']);
  }

  GetVehiclesResponse({required this.vehicles, required this.nextPageUrl});

  @override
  List<Object?> get props => [vehicles, nextPageUrl];
}

class VehicleResponse extends Equatable {
  final String id;
  final String name;

  VehicleResponse({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
