import '../../entities/invaders_list.dart';

abstract class IInvadersRepository {
  Future<InvadersList> getInvadersData(InvadersList invadersList);
  Future<InvadersList> syncData();
}