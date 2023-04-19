import 'package:warhistory/Entities/MainEntity.dart';

class Man extends MainEntity {
  Man(String Id, String Name, this.Birthday, this.Deathday, this.Explanation,
      this.Photo)
      : super(Id, Name);

  String Birthday;
  String Deathday;
  String Photo;
  String Explanation;
}
