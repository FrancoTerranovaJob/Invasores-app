import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/data/providers/api/i_api_provider.dart';
import 'package:urbe_solution/clean/data/providers/api/response/get_characters_response.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/response/get_consolidated_characters.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';
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
      return await dbProvider.createDataBase();
    }
    return true;
  }

  @override
  Future<ConsolidatedData> getCharacters() async {
    try {
      if (await configuration.isOnline()) {
        return await _getOnlineData();
      } else {
        return await _getOfflineData();
      }
    } catch (e) {
      return ConsolidatedData(
          characters: const [], planets: const [], transports: const []);
    }
  }

  Future<ConsolidatedData> _getOnlineData() async {
    final resultCharacters = await apiProvider.getPeople();

    final planetsList = <Planet>[];

    var resultPlanets = await apiProvider.getPlanets();
    for (var plnts in resultPlanets.planets) {
      planetsList.add(Planet(name: plnts.name, id: plnts.id));
    }
    while (resultPlanets.nextPageUrl != null) {
      resultPlanets =
          await apiProvider.getPlanets(pageNumber: resultPlanets.nextPageUrl);
      for (var plnts in resultPlanets.planets) {
        planetsList.add(Planet(name: plnts.name, id: plnts.id));
      }
    }

    final charsResponse = <Character>[];
    for (var chars in resultCharacters.characters) {
      final lastName = chars.name.contains(',')
          ? chars.name
              .substring(chars.name.indexOf(','), chars.name.length - 1)
              .trim()
          : '';
      charsResponse.add(Character(
          name: chars.name,
          lastName: lastName,
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
          transports: [],
          id: ''));
    }
    return ConsolidatedData(characters: [], planets: [], transports: []);
  }

  Future<ConsolidatedData> _getOfflineData() async {
    return ConsolidatedData(characters: [], planets: [], transports: []);
  }

  @override
  Future<bool> addDataToDataBase() async {
    return true;
  }
}
