import 'package:warhistory/Data/SoldierData.dart';
import 'package:warhistory/Entities/Soldiers.dart';

class SoldiersService {
  SoldiersService() {
    _soldierRepository = SoldierRepository();
  }
  Soldier _soldier = Soldier("", "", "", "", "", "", [], false, []);

  Soldier get soldier => _soldier;

  void setSoldier(Soldier soldier) {
    _soldier = soldier;
  }

  late SoldierRepository _soldierRepository;
  void saveSoldier() {
    _soldierRepository.saveSoldier(_soldier);
  }
}

Soldier GlobalSoldier = Soldier("", "", "", "", "", "", [], false, []);
