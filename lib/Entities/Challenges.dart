import 'package:warhistory/Entities/MainEntity.dart';

class Challange extends MainEntity {
  Challange(
      String Id, String Name, this.Winners, this.Losers, List<String> Sources)
      : super(Id, Name, Sources);

  List<String> Winners;
  List<String> Losers;
}
