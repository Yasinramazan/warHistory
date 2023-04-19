import 'package:flutter/cupertino.dart';
import 'package:warhistory/Entities/Mans.dart';

class Stateman extends Man {
  Stateman(String Id, String Name, String Birthday, String DeathDay,
      String Explanataion, String Photo, this.Soldier)
      : super(Id, Name, Birthday, DeathDay, Explanataion, Photo);
  bool Soldier;
}
