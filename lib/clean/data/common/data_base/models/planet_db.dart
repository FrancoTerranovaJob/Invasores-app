import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class PlanetDB extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  PlanetDB(this.id, this.name);
}