import 'package:InvadersApp/clean/data/common/data_base/models/planet_db.dart';
import 'package:InvadersApp/clean/data/common/data_base/models/starship_db.dart';
import 'package:InvadersApp/clean/data/common/data_base/models/vehicle_db.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class InvaderDB extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String bornOn;
  @HiveField(4)
  final String eyesColor;
  @HiveField(5)
  final String hairColor;
  @HiveField(6)
  final String height;
  @HiveField(7)
  final PlanetDB bornPlanet;
  @HiveField(8)
  final String skinColor;
  @HiveField(9)
  final String gender;
  @HiveField(10)
  final HiveList<StarShipDB> starships;
  @HiveField(11)
  final HiveList<VehicleDB> vehicles;

  InvaderDB(
      this.id,
      this.name,
      this.lastName,
      this.bornOn,
      this.eyesColor,
      this.hairColor,
      this.height,
      this.bornPlanet,
      this.skinColor,
      this.gender,
      this.starships,
      this.vehicles);
}