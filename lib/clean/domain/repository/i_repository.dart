import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';

abstract class IRepository {
  Future<bool> initializeApp();
  Future<ConsolidatedData> getCharacters();
}
