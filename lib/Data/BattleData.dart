import 'package:cloud_firestore/cloud_firestore.dart';

import '../Entities/Battles.dart';
import '../Services/Validator.dart';

class BattleRepository {
  CollectionReference battleFirestore =
      FirebaseFirestore.instance.collection("Battles");

  Future<List<Battle>> getBattles() async {
    List<Battle> list = [];

    final snapshot = await battleFirestore.get();
    List<Map<String, dynamic>> map =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    for (var element in map) {
      Battle s = Battle.fromFirestore(element, null);
      list.add(s);
    }
    return list;
  }

  int saveBattle(Battle battle) {
    var db = FirebaseFirestore.instance;
    final map = battle.toFirestore();

    int a = TryCatch.tryCatch((p0) => db.collection("Battles").add(map));
    return a;
  }
}
