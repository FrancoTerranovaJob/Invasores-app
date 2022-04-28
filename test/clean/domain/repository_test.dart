import 'package:flutter_test/flutter_test.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:urbe_solution/clean/data/providers/api/api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_starships_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_vehicles_response.dart';
import 'package:urbe_solution/clean/data/providers/configuration/configuration_provider.dart';
import 'package:urbe_solution/clean/data/providers/configuration/i_configuration_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/data_base_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';
import 'package:urbe_solution/clean/domain/repository/i_repository.dart';
import 'package:urbe_solution/clean/domain/repository/repository.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([ApiProvider])
@GenerateMocks([ConfigurationProvider])
@GenerateMocks([DataBaseProvider])
void main() {
  KiwiContainer()
      .registerSingleton<IApiProvider>((container) => MockApiProvider());

  KiwiContainer().registerSingleton<IDataBaseProvider>(
      (container) => MockDataBaseProvider());
  KiwiContainer().registerSingleton<IConfigurationProvider>(
      (container) => MockConfigurationProvider());

  KiwiContainer().registerSingleton<IRepository>((container) => Repository());
  final dbProvider =
      KiwiContainer().resolve<IDataBaseProvider>() as MockDataBaseProvider;
  final apiProvider =
      KiwiContainer().resolve<IApiProvider>() as MockApiProvider;
  final configuration = KiwiContainer().resolve<IConfigurationProvider>()
      as MockConfigurationProvider;

  final repo = KiwiContainer().resolve<IRepository>();

  final chars = GetCharactersResponse(characters: const [
    CharacterResponse(
        id: 'id1',
        name: 'name',
        eyesColor: 'eyesColor',
        hairColor: 'hairColor',
        height: 'height',
        skinColor: 'skinColor',
        gender: 'gender',
        fromPlanet: 'planet',
        bornYear: 'bornYear',
        ships: ['idStarship'],
        vehicles: ['idVehicle'])
  ], nextPageUrl: null);

  final planets = GetPlanetsResponse(
      planets: [PlanetResponse(id: 'id', name: 'planet')], nextPageUrl: null);

  final vehicles = GetVehiclesResponse(vehicles: [
    VehicleResponse(id: 'idVehicle', name: 'vehicle1', pilotsId: ['id1'])
  ], nextPageUrl: null);
  final starships = GetStarShipsResponse(starships: [
    StarShipResponse(id: 'idStarship', name: 'starship1', pilotsId: ['id1'])
  ], nextPageUrl: null);

  group('initializeApp', () {
    setUp(() {
      when(configuration.isOnline()).thenAnswer((realInvocation) async => true);
      when(configuration.setIsOnline(any))
          .thenAnswer((realInvocation) async => true);
      when(configuration.getIsFirstTime())
          .thenAnswer((realInvocation) async => true);

      when(configuration.setIsFirstTime(any))
          .thenAnswer((realInvocation) async => true);

      when(dbProvider.createDataBase())
          .thenAnswer((realInvocation) async => true);

      when(apiProvider.getPeople()).thenAnswer((realInvocation) async => chars);
      when(apiProvider.getPlanets())
          .thenAnswer((realInvocation) async => planets);
      when(apiProvider.getStarships())
          .thenAnswer((realInvocation) async => starships);
      when(apiProvider.getVehicles())
          .thenAnswer((realInvocation) async => vehicles);
    });

    test('initializeApp first time', () async {
      expect(await repo.initializeApp(), true);
    });

    test('get consolidated data', () async {
      final result = await repo.getConsolidatedData();
      expect(result, isInstanceOf<ConsolidatedData>());
      expect(result.characters[0].id, equals('id1'));
      expect(result.characters[0].name, equals('name'));
      expect(result.characters[0].transports, isInstanceOf<List<Transport>>());
      expect(result.transports[0].pilotsId[0], equals('id1'));
    });
  });
}
