import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:urbe_solution/clean/data/providers/data_base/data_base_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';

class DatabaseModule {
  static Future<bool> databaseInitialize() async {
    final db = await openDatabase('invaders.db', version: 3);
    KiwiContainer().registerSingleton<IDataBaseProvider>(
        (container) => DataBaseProvider(db: db));
    return true;
  }
}
