import 'package:warhistory/Entities/MainEntity.dart';

class Treaty extends MainEntity {
  Treaty(
      String Id, String name, this.Date, this.Explanation, List<String> Sources)
      : super(Id, name, Sources);
  String Explanation;
  String Date;
}
