import 'package:warhistory/Entities/MainEntity.dart';

import 'Battles.dart';

class Map extends MainEntity {
  Map(
      {required String Id,
      required String Name,
      required this.Photo,
      required this.BattleValue,
      required List<String> Sources})
      : super(Id, Name, Sources);

  String Photo;
  Battle BattleValue;
}
