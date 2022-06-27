import 'package:dio/dio.dart';
import 'request/requests.dart';
import 'i_invaders_api.dart';
import 'response/responses.dart';

class InvadersApiImpl implements IInvadersApi {
  final Dio http;

  InvadersApiImpl({required this.http});

  @override
  Future<GetInvadersResponse> getInvaders(
      GetInvadersRequest getInvadersRequest) async {
    if (getInvadersRequest.nextPageUrl != null) {
      final response = await http.get(getInvadersRequest.nextPageUrl!);
      return GetInvadersResponse.fromJson(response.data);
    }
    final response = await http.get('/people');
    return GetInvadersResponse.fromJson(response.data);
  }

  @override
  Future<PlanetResponse> getPlanet(GetPlanetRequest getPlanetRequest) async {
    final response = await http.get(getPlanetRequest.url);
    return PlanetResponse.fromJson(response.data);
  }

  @override
  Future<StarShipResponse> getStarship(
      GetStarshipRequest getStarshipRequest) async {
    final response = await http.get(getStarshipRequest.url);
    return StarShipResponse.fromJson(response.data);
  }

  @override
  Future<VehicleResponse> getVehicle(
      GetVehicleRequest getVehicleRequest) async {
    final response = await http.get(getVehicleRequest.url);
    return VehicleResponse.fromJson(response.data);
  }
}