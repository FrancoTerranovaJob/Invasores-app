import 'package:InvadersApp/clean/data/invaders_data/api/exceptions/invaders_api_exception.dart';
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
    try {
      if (getInvadersRequest.nextPageUrl != null) {
        final response = await http.get(getInvadersRequest.nextPageUrl!);
        return GetInvadersResponse.fromJson(response.data);
      }
      final response = await http.get('/people');
      return GetInvadersResponse.fromJson(response.data);
    } on DioError catch (error, stack) {
      throw DioException(error, stack);
    } catch (error, stack) {
      throw GetInvadersException(error, stack);
    }
  }

  @override
  Future<PlanetResponse> getPlanet(GetPlanetRequest getPlanetRequest) async {
    try {
      final response = await http.get(getPlanetRequest.url);
      return PlanetResponse.fromJson(response.data);
    } on DioError catch (error, stack) {
      throw DioException(error, stack);
    } catch (error, stack) {
      throw GetPlanetException(error, stack);
    }
  }

  @override
  Future<StarShipResponse> getStarship(
      GetStarshipRequest getStarshipRequest) async {
    try {
      final response = await http.get(getStarshipRequest.url);
      return StarShipResponse.fromJson(response.data);
    } on DioError catch (error, stack) {
      throw DioException(error, stack);
    } catch (error, stack) {
      throw GetStarShipsException(error, stack);
    }
  }

  @override
  Future<VehicleResponse> getVehicle(
      GetVehicleRequest getVehicleRequest) async {
    try {
      final response = await http.get(getVehicleRequest.url);
      return VehicleResponse.fromJson(response.data);
    } on DioError catch (error, stack) {
      throw DioException(error, stack);
    } catch (error, stack) {
      throw GetVehiclesException(error, stack);
    }
  }
}
