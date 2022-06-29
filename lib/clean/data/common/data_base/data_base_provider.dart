import 'package:hive_flutter/adapters.dart';

import 'i_data_base_provider.dart';

class DataBaseProvider extends IDataBaseProvider {
  late final Box db;

  @override
  Future<bool> createDataBase() async {
    try {
      await Hive.initFlutter();
      db = await Hive.openBox('invaders');

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> saveInvaders(List<Map<String, dynamic>> invaderList) async {
    try {
      await db.put('invadersList', invaderList);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Map<dynamic, dynamic>>> getInvaders() async {
    try {
      final invaderList =
          List<Map<dynamic, dynamic>>.from(db.get('invadersList')!);
      return invaderList;
    } catch (_) {
      rethrow;
    }
  }
}
