import '../../entities/invaders_list.dart';
import '../repository/i_invaders_repository.dart';

class GetInvadersDataUseCase {
  final IInvadersRepository repository;
  GetInvadersDataUseCase(this.repository);

  Future<InvadersList> call(InvadersList invadersList) async {
    return await repository.getInvadersData(invadersList);
  }
}

class SyncDataUseCase {
  final IInvadersRepository repository;
  SyncDataUseCase(this.repository);

  Future<InvadersList> call(InvadersList invadersList) async {
    final result = await repository.syncData();

    return result;
  }
}