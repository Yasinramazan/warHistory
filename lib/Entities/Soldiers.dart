import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warhistory/Entities/Mans.dart';

class Soldier extends Man {
  Soldier(
      {required String Id,
      required String Name,
      required String Birthday,
      required String Deathday,
      required String Explanation,
      required String Photo,
      required this.Battles,
      required this.Stateman,
      required List<String>? Sources})
      : super(Id, Name, Birthday, Deathday, Explanation, Photo, Sources);
  List<String>? Battles;

  bool Stateman;

  factory Soldier.fromFirestore(
      Map<String, dynamic> snapshot, SnapshotOptions? options) {
    final data = snapshot;
    return Soldier(
      Id: data["Id"],
      Name: data["Name"],
      Birthday: data["Birthday"],
      Deathday: data["Deathday"],
      Explanation: data["Explanation"],
      Photo: data["Photo"],
      Battles: data['Battles'] is Iterable ? List.from(data['Battles']) : null,
      Stateman: data["Stateman"],
      Sources: data['Sources'] is Iterable ? List.from(data['Sources']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (Id != null) "Id": Id,
      if (Name != null) "Name": Name,
      if (Birthday != null) "Birthday": Birthday,
      if (Deathday != null) "Deathday": Deathday,
      if (Explanation != null) "Explanation": Explanation,
      if (Photo != null) "Photo": Photo,
      if (Stateman != null) "Stateman": Stateman,
      if (Battles != null) "Battles": Battles,
      if (Sources != null) "Sources": Sources,
    };
  }
}
