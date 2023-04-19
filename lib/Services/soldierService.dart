import 'package:cloud_firestore/cloud_firestore.dart';

class SoldierService {
  final db = FirebaseFirestore.instance;

  String asyncGetAllSoldiers() {
    var soldiersRef = db.collection("Soldiers");
    return soldiersRef.id;
  }
}
