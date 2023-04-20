import 'package:warhistory/Entities/Challenges.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Entities/Wars.dart';

class Battle extends Challange {
  Battle(
      String Id,
      List<String> Winners,
      List<String> Losers,
      String Name,
      this.Date,
      this.MapValue,
      this.Soldiers,
      this.WarValue,
      List<String> Sources)
      : super(Id, Name, Winners, Losers, Sources);

  String Date;
  Map MapValue;
  Soldier Soldiers;
  War WarValue;
}
