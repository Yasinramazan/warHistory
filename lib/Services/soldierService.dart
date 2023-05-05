import 'package:warhistory/Data/SoldierData.dart';
import 'package:warhistory/Entities/Soldiers.dart';

class SoldiersService {
  SoldiersService() {
    _soldierRepository = SoldierRepository();
  }
  Soldier _soldier = Soldier(
      Id: "",
      Name: "",
      Birthday: "",
      Deathday: "",
      Explanation: "",
      Photo: "",
      Battles: [],
      Stateman: false,
      Sources: []);

  Soldier get soldier => _soldier;

  void setSoldier(Soldier soldier) {
    _soldier = soldier;
  }

  late SoldierRepository _soldierRepository;
  int saveSoldier() {
    int a = _soldierRepository.saveSoldier(_soldier);
    GlobalSoldier = Soldier(
        Id: "",
        Name: "",
        Birthday: "",
        Deathday: "",
        Explanation: "",
        Photo: "",
        Battles: [],
        Stateman: false,
        Sources: []);
    return a;
  }

  Future<List<Soldier>> getSoldiers() {
    List<Soldier> soldiers = [];
    return _soldierRepository.getSoldiers();
  }

  Soldier getSoldier() {
    return GlobalSoldier;
  }
}

Soldier GlobalSoldier = Soldier(
    Id: "",
    Name: "",
    Birthday: "",
    Deathday: "",
    Explanation: "",
    Photo: "",
    Battles: [],
    Stateman: false,
    Sources: []);
