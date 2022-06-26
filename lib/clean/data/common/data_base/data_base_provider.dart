import 'package:hive_flutter/adapters.dart';

import 'i_data_base_provider.dart';

class DataBaseProvider extends IDataBaseProvider {
  late final Box db;

  @override
  Future<bool> createDataBase(bool firstTime) async {
    try {
      if (firstTime) {
        await Hive.initFlutter();
        db = await Hive.openBox('invaders');
        return true;
      }
      await Hive.initFlutter();
      db = await Hive.openBox('invaders');

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveInvaders(List<Map<String, dynamic>> invaderList) async {
    try {
      await db.put('invadersList', invaderList);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Map<dynamic, dynamic>>> getInvaders() async {
    final invaderList =
        List<Map<dynamic, dynamic>>.from(db.get('invadersList')!);
    return invaderList;
  }
}