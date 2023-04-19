import 'package:warhistory/Entities/MainEntity.dart';

class Challange extends MainEntity {
  Challange(String Id, String Name, this.Winners, this.Losers)
      : super(Id, Name);

  List<String> Winners;
  List<String> Losers;
}
