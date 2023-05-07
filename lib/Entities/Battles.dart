import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warhistory/Entities/Challenges.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Entities/Wars.dart';

class Battle extends Challange {
  Battle(
      {required String Id,
      required List<String>? Winners,
      required List<String>? Losers,
      required String Name,
      required this.Date,
      required this.MapId,
      required this.Soldiers,
      required this.WarId,
      required List<String>? Sources,
      required String Explanation})
      : super(Id, Name, Winners!, Losers!, Sources!, Explanation);

  String Date;
  String MapId;
  List<String>? Soldiers;
  String WarId;

  factory Battle.fromFirestore(
      Map<String, dynamic> snapshot, SnapshotOptions? options) {
    final data = snapshot;
    return Battle(
      Id: data["Id"],
      Name: data["Name"],
      Winners: data['Winners'] is Iterable ? List.from(data['Winners']) : null,
      Losers: data['Losers'] is Iterable ? List.from(data['Losers']) : null,
      Explanation: data["Explanation"],
      Date: data["Date"],
      Soldiers:
          data['Soldiers'] is Iterable ? List.from(data['Soldiers']) : null,
      MapId: data["MapId"],
      WarId: data["WarId"],
      Sources: data['Sources'] is Iterable ? List.from(data['Sources']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (Id != null) "Id": Id,
      if (Name != null) "Name": Name,
      if (Winners != null) "Winners": Winners,
      if (Losers != null) "Losers": Losers,
      if (Explanation != null) "Explanation": Explanation,
      if (Soldiers != null) "Soldiers": Soldiers,
      if (Date != null) "Date": Date,
      if (WarId != null) "WarId": WarId,
      if (MapId != null) "MapId": MapId,
      if (Sources != null) "Sources": Sources,
    };
  }
}
