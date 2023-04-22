import 'package:warhistory/Entities/Mans.dart';

class Soldier extends Man {
  Soldier(
      String Id,
      String Name,
      String Birthday,
      String DeathDay,
      String Explanation,
      String Photo,
      this.Battles,
      this.Stateman,
      List<String> Sources)
      : super(Id, Name, Birthday, DeathDay, Explanation, Photo, Sources);
  List<String> Battles;

  bool Stateman;
}
