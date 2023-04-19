import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warhistory/Entities/Soldiers.dart';

class SoldiersService {
  CollectionReference soldiers =
      FirebaseFirestore.instance.collection("Soldiers");

  Future<List<Soldier>> getSoldiers() async {
    List<Soldier> list = [];
    final value = await soldiers.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        list.add(doc["Name"]);
      });
    });
    if (value == null)
      return [];
    else
      return list;
  }
}
