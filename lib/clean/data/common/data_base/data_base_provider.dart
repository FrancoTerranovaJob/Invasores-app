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
  Future<bool> saveInvaders(
      int pageNumber, Map<String, dynamic> invaderList) async {
    try {
      await db.put(pageNumber, invaderList);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<dynamic, dynamic>> getInvaders(int pageNumber) async {
    try {
      final invaderList = Map<dynamic, dynamic>.from(db.get(pageNumber)!);
      return invaderList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  bool canLoadMore(int nextPage) {
    return db.containsKey(nextPage);
  }
}