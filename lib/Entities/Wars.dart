import 'package:warhistory/Entities/Challenges.dart';

import 'Battles.dart';

class War extends Challange {
  War(String Id, String Name, List<String> Winners, List<String> Losers,
      this.Battles, this.PreDate, this.PostDate)
      : super(Id, Name, Winners, Losers);
  String PreDate;
  String PostDate;
  List<Battle> Battles;
}
