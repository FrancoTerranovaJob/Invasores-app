import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';

class IsValidData {
  bool call(ConsolidatedData data) {
    if (data.characters.isEmpty) {
      return false;
    }
    return true;
  }
}
