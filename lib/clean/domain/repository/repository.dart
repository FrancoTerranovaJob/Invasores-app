import 'dart:async';

import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/request/report_person_request.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_planets_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_starships_response.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_vehicles_response.dart';
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
      await getConsolidatedData();
      await configuration.setIsFirstTime(false);
    } else {
      configuration.setIsOnline(false);
    }

    return true;
  }

  @override
  Future<ConsolidatedData> getConsolidatedData() async {
    if (await configuration.isOnline()) {
      return await _getOnlineData();
    } else {
      return await _getOfflineData();
    }
  }

  Future<ConsolidatedData> _getOnlineData() async {
    try {
      final result = await Future.wait([
        _getAllPeople(),
        _getAllPlanets(),
        _getAllStarships(),
        _getAllVehicles()
      ]);
      final resultCharacters = result[0] as GetCharactersResponse;

      final resultPlanets = result[1] as GetPlanetsResponse;
      final resultStarships = result[2] as GetStarShipsResponse;
      final resultVehicles = result[3] as GetVehiclesResponse;

      final charsResponse = <Character>[];
      final charsResponseDB = <CharactersDB>[];
      final plntsResponse = <Planet>[];
      final plntsResponseDB = <PlanetDB>[];
      final transportResponse = <Transport>[];
      final transportResponseDB = <TransportsDB>[];

      for (var chars in resultCharacters.characters) {
        charsResponse.add(_getCharResponse(chars));
        charsResponseDB.add(_getCharResponseDB(chars));
      }
      for (var plnts in resultPlanets.planets) {
        plntsResponse.add(_getPlanetResponse(plnts));
        plntsResponseDB.add(_getPlanetResponseDB(plnts));
      }
      for (var trnsp in resultVehicles.vehicles) {
        transportResponse.add(_getVehicleResponse(trnsp));
        transportResponseDB.add(_getVehicleResponseDB(trnsp));
      }
      for (var trnsp in resultStarships.starships) {
        transportResponse.add(_getShipsResponse(trnsp));
        transportResponseDB.add(_getShipsResponseDB(trnsp));
      }

      final consData = ConsolidatedData(
          characters: charsResponse,
          planets: plntsResponse,
          transports: transportResponse,
          isOnline: true);
      await _addDataToDataBase(
          transportResponseDB, plntsResponseDB, charsResponseDB);
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
                        : chars.gender == 'none'
                            ? GenderType.na
                            : GenderType.unknown,
            transports:
                List<Transport>.from(chars.transports.transport.map((e) {
              return Transport(
                  name: e.name,
                  type: e.type == 'VEHICLE'
                      ? TransportType.vehicle
                      : TransportType.starship,
                  id: '',
                  pilotsId: []);
            }).toList())));
      }
      return ConsolidatedData(
          characters: characters, planets: [], transports: [], isOnline: false);
    } catch (e) {
      return ConsolidatedData(
          characters: [], planets: [], transports: [], isOnline: false);
    }
  }

  Future<void> _addDataToDataBase(List<TransportsDB> transports,
      List<PlanetDB> planets, List<CharactersDB> charts) async {
    try {
      await dbProvider
          .addTransports(SetTransportsRequest(transport: transports));
      await dbProvider.addPlanets(SetPlanetsRequest(planets: planets));
      await dbProvider.addCharacters(SetCharactersRequest(characters: charts));
    } catch (_) {}
  }

  Future<GetPlanetsResponse> _getAllPlanets() async {
    final planetsList = <PlanetResponse>[];
    var resultPlanets = await apiProvider.getPlanets();
    planetsList.addAll(resultPlanets.planets);
    while (resultPlanets.nextPageUrl != null) {
      resultPlanets =
          await apiProvider.getPlanets(nextPageUrl: resultPlanets.nextPageUrl);

      planetsList.addAll(resultPlanets.planets);
    }

    return GetPlanetsResponse(planets: planetsList, nextPageUrl: null);
  }

  Future<GetVehiclesResponse> _getAllVehicles() async {
    final vehiclesList = <VehicleResponse>[];
    var resultVehicles = await apiProvider.getVehicles();
    vehiclesList.addAll(resultVehicles.vehicles);
    while (resultVehicles.nextPageUrl != null) {
      resultVehicles = await apiProvider.getVehicles(
          nextPageUrl: resultVehicles.nextPageUrl);
      vehiclesList.addAll(resultVehicles.vehicles);
    }
    return GetVehiclesResponse(vehicles: vehiclesList, nextPageUrl: null);
  }

  Future<GetStarShipsResponse> _getAllStarships() async {
    final starShipsList = <StarShipResponse>[];
    var resultStarships = await apiProvider.getStarships();
    starShipsList.addAll(resultStarships.starships);
    while (resultStarships.nextPageUrl != null) {
      resultStarships = await apiProvider.getStarships(
          nextPageUrl: resultStarships.nextPageUrl);
      starShipsList.addAll(resultStarships.starships);
    }
    return GetStarShipsResponse(starships: starShipsList, nextPageUrl: null);
  }

  @override
  Future<bool> enableOnline() async {
    return await configuration.setIsOnline(true);
  }

  @override
  Future<ConsolidatedData> syncData() async {
    return await getConsolidatedData();
  }

  @override
  Future<bool> disableOnline() async {
    return await configuration.setIsOnline(false);
  }

  @override
  Future<bool> getIsOnline() async {
    return await configuration.isOnline();
  }

  CharactersDB _getCharResponseDB(CharacterResponse chrs) {
    return CharactersDB(
        id: chrs.id,
        name: chrs.name,
        eyesColor: chrs.eyesColor,
        hairColor: chrs.hairColor,
        height: chrs.height,
        skinColor: chrs.skinColor,
        gender: chrs.gender,
        fromPlanetId: chrs.fromPlanet,
        bornYear: chrs.bornYear,
        vehiclesId: chrs.vehicles,
        starShipsId: chrs.ships);
  }

  Character _getCharResponse(CharacterResponse chars) {
    return Character(
        name: chars.name,
        lastName: '',
        bornOn: chars.bornYear,
        eyesColor: chars.eyesColor,
        hairColor: chars.hairColor,
        height: chars.height,
        bornPlanet: Planet(name: '', id: chars.fromPlanet),
        skinColor: chars.skinColor,
        gender: chars.gender == 'male'
            ? GenderType.male
            : chars.gender == 'female'
                ? GenderType.female
                : chars.gender == 'unknown'
                    ? GenderType.unknown
                    : chars.gender == 'none'
                        ? GenderType.na
                        : GenderType.unknown,
        transports: [],
        id: chars.id);
  }

  PlanetDB _getPlanetResponseDB(PlanetResponse plnts) {
    return PlanetDB(name: plnts.name, id: plnts.id);
  }

  Planet _getPlanetResponse(PlanetResponse plnts) {
    return Planet(name: plnts.name, id: plnts.id);
  }

  TransportsDB _getVehicleResponseDB(VehicleResponse trnsp) {
    return TransportsDB(id: trnsp.id, name: trnsp.name, type: 'VEHICLE');
  }

  Transport _getVehicleResponse(VehicleResponse trnsp) {
    return Transport(
        id: trnsp.id,
        name: trnsp.name,
        type: TransportType.vehicle,
        pilotsId: trnsp.pilotsId);
  }

  TransportsDB _getShipsResponseDB(StarShipResponse trnsp) {
    return TransportsDB(id: trnsp.id, name: trnsp.name, type: 'STARSHIP');
  }

  Transport _getShipsResponse(StarShipResponse trnsp) {
    return Transport(
        id: trnsp.id,
        name: trnsp.name,
        type: TransportType.starship,
        pilotsId: trnsp.pilotsId);
  }

  Future<GetCharactersResponse> _getAllPeople() async {
    final peoples = <CharacterResponse>[];
    var pplResult = await apiProvider.getPeople();
    peoples.addAll(pplResult.characters);
    while (pplResult.nextPageUrl != null) {
      pplResult =
          await apiProvider.getPeople(nextPageUrl: pplResult.nextPageUrl);
      peoples.addAll(pplResult.characters);
    }
    return GetCharactersResponse(
        characters: peoples, nextPageUrl: pplResult.nextPageUrl);
  }

  @override
  Future<bool> reportPerson(Character character) async {
    return await apiProvider.reportPerson(ReportPersonRequest(
        id: 1, date: DateTime.now().toString(), name: character.name));
  }
}
