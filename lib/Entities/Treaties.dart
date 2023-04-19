import 'package:warhistory/Entities/MainEntity.dart';

class Treaty extends MainEntity {
  Treaty(String Id, String name, this.Date, this.Explanation) : super(Id, name);
  String Explanation;
  String Date;
}
