import 'package:cloud_firestore/cloud_firestore.dart';

import '../Entities/Soldiers.dart';

class SoldierRepository {
  CollectionReference soldierFirestore =
      FirebaseFirestore.instance.collection("Soldiers");

  Future<List<Soldier>> getSoldiers() async {
    List<Soldier> list = [];
    final value =
        await soldierFirestore.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        list.add(doc["Name"]);
      });
    });
    if (value == null)
      return [];
    else
      return list;
  }

  void saveSoldier(Soldier soldier) {
    soldierFirestore.doc(soldier.Name).set({
      'Name': soldier.Name,
      'Birthday': soldier.Birthday,
      'Deathday': soldier.Deathday,
      'Explanation': soldier.Explanation,
      'Stateman': soldier.Stateman,
      'Photo': soldier.Photo,
      'Battles': soldier.Battles,
      'Sources': soldier.Sources
    });
  }
}
