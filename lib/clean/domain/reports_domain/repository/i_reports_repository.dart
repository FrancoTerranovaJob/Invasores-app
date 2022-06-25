import '../../entities/invader.dart';

abstract class IReportsRepository {
  Future<bool> reportPerson(Invader invader);
}