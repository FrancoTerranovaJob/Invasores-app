import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_characters_request.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_planets_request.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_transports_request.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/response/get_consolidated_characters.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';
import 'package:urbe_solution/clean/domain/repository/i_repository.dart';

import '../../data/providers/configuration/i_configuration_provider.dart';
import '../entities/character.dart';
import '../entities/planet.dart';

class Repository implements IRepository {
  final dbProvider = KiwiContainer().resolve<IDataBaseProvider>();
  final configuration = KiwiContainer().resolve<IConfigurationProvider>();
  final apiProvider = KiwiContainer().resolve<IApiProvider>();
  @override
  Future<bool> initializeApp() async {
    final isFirstTime = await configuration.getIsFirstTime();
    if (isFirstTime) {
      await dbProvider.createDataBase();
      await getCharacters();
    }
    return true;
  }

  @override
  Future<ConsolidatedData> getCharacters() async {
    if (await configuration.isOnline()) {
      return await _getOnlineData();
    } else {
      return await _getOfflineData();
    }
  }

  Future<ConsolidatedData> _getOnlineData() async {
    try {
      final resultTransports = <Transport>[];
      final resultCharacters = await apiProvider.getPeople();

      final resultPlanets = await _getAllPlanets();
      final resultStarships = await _getAllStarships();
      final resultVehicles = await _getAllVehicles();
      resultTransports.addAll(resultStarships);
      resultTransports.addAll(resultVehicles);

      final charsResponse = <Character>[];
      for (var chars in resultCharacters.characters) {
        final planet = resultPlanets
            .firstWhere((element) => element.id == chars.fromPlanet);
        final lastName = chars.name.contains(' ')
            ? chars.name
                .substring(chars.name.indexOf(' '), chars.name.length)
                .trim()
            : '';
        final name = lastName.isNotEmpty
            ? chars.name.substring(0, chars.name.indexOf(' '))
            : chars.name;
        charsResponse.add(Character(
            name: name,
            lastName: lastName,
            bornOn: chars.bornYear,
            eyesColor: chars.eyesColor,
            hairColor: chars.hairColor,
            height: chars.height,
            bornPlanet: planet,
            skinColor: chars.skinColor,
            gender: chars.gender == 'male'
                ? GenderType.male
                : chars.gender == 'female'
                    ? GenderType.female
                    : chars.gender == 'unknown'
                        ? GenderType.unknown
                        : chars.gender == 'N/A'
                            ? GenderType.na
                            : GenderType.unknown,
            transports: const [],
            id: chars.id));
      }
      final consData = ConsolidatedData(
          characters: charsResponse,
          planets: resultPlanets,
          transports: resultTransports,
          isOnline: true);
      await _addDataToDataBase(consData);
      return consData;
    } catch (e) {
      return ConsolidatedData(
          characters: const [],
          planets: const [],
          transports: const [],
          isOnline: true);
    }
  }

  Future<ConsolidatedData> _getOfflineData() async {
    try {
      final characters = <Character>[];
      final response = await dbProvider.getConsolidatedCharacters();

      for (var chars in response.characters) {
        characters.add(Character(
            id: chars.id,
            name: chars.name,
            lastName: '',
            bornOn: chars.bornYear,
            eyesColor: chars.eyesColor,
            hairColor: chars.hairColor,
            height: chars.height,
            bornPlanet: Planet(name: chars.fromPlanet, id: ''),
            skinColor: chars.skinColor,
            gender: chars.gender == 'male'
                ? GenderType.male
                : chars.gender == 'female'
                    ? GenderType.female
                    : chars.gender == 'unknown'
                        ? GenderType.unknown
                        : chars.gender == 'N/A'
                            ? GenderType.na
                            : GenderType.unknown,
            transports: List.from(chars.transports.transport.map((e) {
              Transport(
                  name: e.name,
                  type: e.type == 'VEHICLE'
                      ? TransportType.vehicle
                      : TransportType.starship,
                  id: '');
            }).toList())));
      }
      return ConsolidatedData(
          characters: characters, planets: [], transports: [], isOnline: false);
    } catch (e) {
      return ConsolidatedData(
          characters: [], planets: [], transports: [], isOnline: false);
    }
  }

  Future<void> _addDataToDataBase(ConsolidatedData characters) async {
    try {
      final planets = <PlanetDB>[];
      final transports = <TransportsDB>[];
      final charts = <CharactersDB>[];
      for (var plnts in characters.planets) {
        planets.add(PlanetDB(name: plnts.name, id: plnts.id));
      }
      for (var trnsp in characters.transports) {
        transports.add(TransportsDB(
            id: trnsp.id,
            name: trnsp.name,
            type:
                trnsp.type == TransportType.starship ? 'STARSHIP' : 'VEHICLE'));
      }
      await dbProvider
          .addTransports(SetTransportsRequest(transport: transports));
      await dbProvider.addPlanets(SetPlanetsRequest(planets: planets));

      for (var chrs in characters.characters) {
        final List<String> vehicles = List.from(chrs.transports
            .where((element) => element.type == TransportType.vehicle));
        final List<String> starships = List.from(chrs.transports
            .where((element) => element.type == TransportType.starship));
        charts.add(CharactersDB(
            id: chrs.id,
            name: chrs.name,
            eyesColor: chrs.eyesColor,
            hairColor: chrs.hairColor,
            height: chrs.height,
            skinColor: chrs.skinColor,
            gender: chrs.gender == GenderType.male
                ? 'male'
                : chrs.gender == GenderType.female
                    ? 'female'
                    : chrs.gender == GenderType.unknown
                        ? 'unknown'
                        : chrs.gender == GenderType.na
                            ? 'N/A'
                            : 'unknown',
            fromPlanetId: chrs.bornPlanet.id,
            bornYear: chrs.bornOn,
            vehiclesId: vehicles.map((e) => e).toList(),
            starShipsId: starships.map((e) => e).toList()));
      }
      await dbProvider.addCharacters(SetCharactersRequest(characters: charts));
    } catch (_) {}
  }

  Future<List<Planet>> _getAllPlanets() async {
    final planetsList = <Planet>[];
    var resultPlanets = await apiProvider.getPlanets();
    for (var plnts in resultPlanets.planets) {
      planetsList.add(Planet(name: plnts.name, id: plnts.id));
    }
    while (resultPlanets.nextPageUrl != null) {
      resultPlanets =
          await apiProvider.getPlanets(nextPageUrl: resultPlanets.nextPageUrl);
      for (var plnts in resultPlanets.planets) {
        planetsList.add(Planet(name: plnts.name, id: plnts.id));
      }
    }
    return planetsList;
  }

  Future<List<Transport>> _getAllVehicles() async {
    final vehiclesList = <Transport>[];
    var resultVehicles = await apiProvider.getVehicles();
    for (var veh in resultVehicles.vehicles) {
      vehiclesList.add(
          Transport(name: veh.name, type: TransportType.vehicle, id: veh.id));
    }
    while (resultVehicles.nextPageUrl != null) {
      resultVehicles = await apiProvider.getVehicles(
          nextPageUrl: resultVehicles.nextPageUrl);
      for (var veh in resultVehicles.vehicles) {
        vehiclesList.add(
            Transport(name: veh.name, type: TransportType.vehicle, id: veh.id));
      }
    }
    return vehiclesList;
  }

  Future<List<Transport>> _getAllStarships() async {
    final starShipsList = <Transport>[];
    var resultStarships = await apiProvider.getStarships();
    for (var str in resultStarships.starships) {
      starShipsList.add(
          Transport(name: str.name, type: TransportType.starship, id: str.id));
    }
    while (resultStarships.nextPageUrl != null) {
      resultStarships = await apiProvider.getStarships(
          nextPageUrl: resultStarships.nextPageUrl);
      for (var veh in resultStarships.starships) {
        starShipsList.add(
            Transport(name: veh.name, type: TransportType.vehicle, id: veh.id));
      }
    }
    return starShipsList;
  }
}
