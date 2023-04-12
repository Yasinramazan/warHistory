import 'package:warhistory/Entities/MainEntity.dart';

import 'Battles.dart';

class Map extends MainEntity {
  Map({
    required String Id,
    required String Name,
    required this.Photo,
    required this.BattleValue,
  }) : super(Id, Name);

  String Photo;
  Battle BattleValue;
}
