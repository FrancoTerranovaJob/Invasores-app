import 'request/get_invaders_request.dart';
import 'request/get_planet_request.dart';
import 'request/get_starship_request.dart';
import 'request/get_vehicle_request.dart';
import 'response/get_invaders_response.dart';
import 'response/planet_response.dart';
import 'response/starship_response.dart';
import 'response/vehicle_response.dart';

abstract class IInvadersApi {
  Future<GetInvadersResponse> getInvaders(
      GetInvadersRequest getInvadersRequest);
  Future<PlanetResponse> getPlanet(GetPlanetRequest getPlanetRequest);
  Future<VehicleResponse> getVehicle(GetVehicleRequest getVehicleRequest);
  Future<StarShipResponse> getStarship(GetStarshipRequest getStarshipRequest);
}
