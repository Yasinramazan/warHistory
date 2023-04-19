import 'package:warhistory/Entities/Mans.dart';

import 'Battles.dart';
import 'Wars.dart';

class Soldier extends Man {
  Soldier(
      String Id,
      String Name,
      String Birthday,
      String DeathDay,
      String Explanataion,
      String Photo,
      this.BattlesValue,
      this.WarsValue,
      this.Stateman)
      : super(Id, Name, Birthday, DeathDay, Explanataion, Photo);
  Battle BattlesValue;
  War WarsValue;
  bool Stateman;
}
