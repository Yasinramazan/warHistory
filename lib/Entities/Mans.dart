import 'package:warhistory/Entities/MainEntity.dart';

class Man extends MainEntity {
  Man(String Id, String Name, this.Birthday, this.Deathday, this.Explanation,
      this.Photo, List<String> Sources)
      : super(Id, Name, Sources);

  String Birthday;
  String Deathday;
  String Photo;
  String Explanation;
}
