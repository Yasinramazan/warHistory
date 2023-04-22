import 'package:warhistory/Entities/Challenges.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Entities/Wars.dart';

class Battle extends Challange {
  Battle(String Id, List<String> Winners, List<String> Losers, String Name,
      this.Date, this.MapId, this.Soldiers, this.WarId, List<String> Sources)
      : super(Id, Name, Winners, Losers, Sources);

  String Date;
  String MapId;
  List<String> Soldiers;
  String WarId;
}
