import 'package:dio/dio.dart';

import 'i_invaders_api.dart';
import 'request/get_invaders_request.dart';
import 'request/get_planet_request.dart';
import 'request/get_starship_request.dart';
import 'request/get_vehicle_request.dart';
import 'response/get_invaders_response.dart';
import 'response/planet_response.dart';
import 'response/starship_response.dart';
import 'response/vehicle_response.dart';

class InvadersApiImpl implements IInvadersApi {
  final Dio api;

  InvadersApiImpl({required this.api});

  @override
  Future<GetInvadersResponse> getInvaders(
      GetInvadersRequest getInvadersRequest) async {
    if (getInvadersRequest.nextPageUrl != null) {
      final response = await api.get(getInvadersRequest.nextPageUrl!);
      return GetInvadersResponse.fromJson(response.data);
    }
    final response = await api.get('/people');
    return GetInvadersResponse.fromJson(response.data);
  }

  @override
  Future<PlanetResponse> getPlanet(GetPlanetRequest getPlanetRequest) async {
    final response = await api.get(getPlanetRequest.url);
    return PlanetResponse.fromJson(response.data);
  }

  @override
  Future<StarShipResponse> getStarship(
      GetStarshipRequest getStarshipRequest) async {
    final response = await api.get(getStarshipRequest.url);
    return StarShipResponse.fromJson(response.data);
  }

  @override
  Future<VehicleResponse> getVehicle(
      GetVehicleRequest getVehicleRequest) async {
    final response = await api.get(getVehicleRequest.url);
    return VehicleResponse.fromJson(response.data);
  }
}