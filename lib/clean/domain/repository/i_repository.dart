import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';

import '../entities/character.dart';

abstract class IRepository {
  Future<bool> initializeApp();
  Future<ConsolidatedData> getConsolidatedData();
  Future<ConsolidatedData> syncData();
  Future<bool> enableOnline();
  Future<bool> disableOnline();
  Future<bool> getIsOnline();

  Future<bool> reportPerson(Character character);
}
