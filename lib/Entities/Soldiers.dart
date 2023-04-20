import 'package:warhistory/Entities/Mans.dart';

import 'Battles.dart';
import 'Wars.dart';

class Soldier extends Man {
  Soldier(
      String Id,
      String Name,
      String Birthday,
      String DeathDay,
      String Explanation,
      String Photo,
      this.BattlesValue,
      this.WarsValue,
      this.Stateman,
      List<String> Sources)
      : super(Id, Name, Birthday, DeathDay, Explanation, Photo, Sources);
  Battle BattlesValue;
  War WarsValue;
  bool Stateman;
}
