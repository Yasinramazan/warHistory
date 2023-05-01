import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warhistory/Services/Validator.dart';
import 'package:warhistory/dummy.dart';

import '../Entities/Soldiers.dart';

class SoldierRepository {
  CollectionReference soldierFirestore =
      FirebaseFirestore.instance.collection("Soldiers");

  Future<List<Soldier>> getSoldiers() async {
    List<Soldier> list = [];
    CollectionReference ref = FirebaseFirestore.instance.collection('Soldiers');
    final snapshot = await ref.get();
    List<Map<String, dynamic>> map =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    for (var element in map) {
      Soldier s = Soldier.fromFirestore(element, null);
      list.add(s);
    }
    return list;
  }

  int saveSoldier(Soldier soldier) {
    var db = FirebaseFirestore.instance;
    final map = soldier.toFirestore();

    int a = TryCatch.tryCatch((p0) => db.collection("Soldiers").add(map));
    return a;
  }
}
