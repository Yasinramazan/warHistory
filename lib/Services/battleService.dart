import 'package:warhistory/Data/BattleData.dart';
import 'package:warhistory/Data/SoldierData.dart';
import 'package:warhistory/Entities/Battles.dart';
import 'package:warhistory/Entities/Soldiers.dart';

class BattlesService {
  BattlesService() {
    _battleRepository = BattleRepository();
  }
  Battle _battle = Battle(
      Id: "",
      Winners: [],
      Losers: [],
      Name: "",
      Date: "",
      MapId: "",
      Soldiers: [],
      WarId: "",
      Sources: [],
      Explanation: "");

  Battle get battle => _battle;

  void setBattle(Battle battle) {
    _battle = battle;
  }

  late BattleRepository _battleRepository;

  int saveBattle(Battle battle) {
    int a = _battleRepository.saveBattle(battle);
    GlobalBattle = Battle(
        Id: "",
        Winners: [],
        Losers: [],
        Name: "",
        Date: "",
        MapId: "",
        Soldiers: [],
        WarId: "",
        Sources: [],
        Explanation: "");
    return a;
  }
}

Battle GlobalBattle = Battle(
    Id: "",
    Winners: [],
    Losers: [],
    Name: "",
    Date: "",
    MapId: "",
    Soldiers: [],
    WarId: "",
    Sources: [],
    Explanation: "");
