import 'package:warhistory/Entities/Challenges.dart';

import 'Battles.dart';

class War extends Challange {
  War(String Id, String Name, List<String> Winners, List<String> Losers,
      this.Battles, this.PreDate, this.PostDate, List<String> Sources)
      : super(Id, Name, Winners, Losers, Sources);
  String PreDate;
  String PostDate;
  List<Battle> Battles;
}
