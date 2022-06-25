import 'package:hive_flutter/adapters.dart';

import 'i_data_base_provider.dart';

class DataBaseProvider extends IDataBaseProvider {
  late final Box<Map<String, dynamic>> db;

  @override
  Future<bool> createDataBase(bool firstTime) async {
    try {
      if (firstTime) {
        await Hive.initFlutter();
        db = await Hive.openBox<Map<String, dynamic>>('invaders');
        return true;
      }
      db = Hive.box('invaders');

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveInvaders(List<Map<String, dynamic>> invaderList) async {
    try {
      for (var invader in invaderList) {
        db.put(invader['id'], invader);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getInvaders() async {
    return db.toMap().values.toList();
  }
}