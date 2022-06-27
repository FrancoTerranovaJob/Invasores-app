import 'package:InvadersApp/clean/data/common/commons.dart';
import 'package:InvadersApp/clean/data/invaders_data/api/request/requests.dart';
import 'package:InvadersApp/clean/data/invaders_data/api/response/responses.dart';
import 'package:InvadersApp/clean/domain/entities/entities.dart';

import '../../../data/invaders_data/api/i_invaders_api.dart';

import 'i_invaders_repository.dart';

class InvadersRepository implements IInvadersRepository {
  final IDataBaseProvider db;
  final IConfigurationProvider configuration;
  final IInvadersApi api;
  InvadersRepository(this.db, this.configuration, this.api);

  @override
  Future<InvadersList> getInvadersData(InvadersList invadersList) async {
    if (await configuration.isOnline()) {
      return await _getOnlineData(invadersList);
    } else {
      return await _getOfflineData();
    }
  }

  Future<InvadersList> _getOnlineData(InvadersList invadersList) async {
    try {
      if (invadersList.currentPage == 0) {
        final GetInvadersResponse response =
            await api.getInvaders(GetInvadersRequest());
        final InvadersList invaders = InvadersList(
            invaders: response.characters
                .map((invaderResponse) => Invader.fromInvaderResponse(
                    invaderResponse: invaderResponse))
                .toList(),
            nextPage: response.nextPageUrl,
            currentPage: 1);
        await _saveDataInDataBase(invaders.invaders);
        return invaders;
      } else if (invadersList.nextPage != null) {
        final GetInvadersResponse response = await api.getInvaders(
            GetInvadersRequest(nextPageUrl: invadersList.nextPage));

        final List<Invader> newInvaders = response.characters
            .map((invaderResponse) =>
                Invader.fromInvaderResponse(invaderResponse: invaderResponse))
            .toList();
        invadersList.invaders.addAll(newInvaders);
        final InvadersList invaders = InvadersList(
            invaders: invadersList.invaders,
            nextPage: response.nextPageUrl,
            currentPage: invadersList.currentPage + 1);
        await _saveDataInDataBase(invaders.invaders);
        return invaders;
      }
      return invadersList;
    } catch (e) {
      return InvadersList();
    }
  }

  Future<InvadersList> _getOfflineData() async {
    final response = await db.getInvaders();
    final invaderList =
        response.map((invader) => Invader.fromDataBase(invader)).toList();
    return InvadersList(invaders: invaderList);
  }

  Future<bool> _saveDataInDataBase(List<Invader> invaders) async {
    await db.saveInvaders(invaders.map((invader) => invader.toJson()).toList());
    return true;
  }

  @override
  Future<InvadersList> syncData() async {
    return await _getOnlineData(InvadersList());
  }
}