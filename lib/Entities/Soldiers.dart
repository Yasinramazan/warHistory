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
      this.Battles,
      this.Wars,
      this.Stateman,
      List<String> Sources)
      : super(Id, Name, Birthday, DeathDay, Explanation, Photo, Sources);
  List<String> Battles;
  List<String> Wars;
  bool Stateman;
}
