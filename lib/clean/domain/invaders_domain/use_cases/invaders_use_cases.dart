import '../../entities/invaders_list.dart';
import '../repository/i_invaders_repository.dart';

class GetInvadersDataUseCase {
  final IInvadersRepository repository;
  GetInvadersDataUseCase(this.repository);

  Future<InvadersList> call(InvadersList invadersList) async {
    try {
      return await repository.getInvadersData(invadersList);
    } catch (_) {
      rethrow;
    }
  }
}

class SyncDataUseCase {
  final IInvadersRepository repository;
  SyncDataUseCase(this.repository);

  Future<InvadersList> call(InvadersList invadersList) async {
    try {
      final result = await repository.syncData();

      return result;
    } catch (_) {
      rethrow;
    }
  }
}
