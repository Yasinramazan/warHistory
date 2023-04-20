import 'package:warhistory/Entities/Battles.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Entities/Wars.dart';

Soldier soldier = Soldier("1", "Erwin Rommel", "1844", "1940", "Çöl Tilkisi",
    "dfsdfs", ["1"], ["1"], false, ["WW2"]);

List<Battle> battles = [
  Battle(
      "1", ["İngiltere"], ["Almanya"], "El Alamein", "1943", "1", [], "1", []),
  Battle("2", ["Yunanistan"], ["Türkiye"], "Büyük Tarruz", "1922", "2", [], "2",
      [])
];

List<Soldier> soldiers = [
  Soldier(
    "1",
    "Erwin Rommel",
    "1844",
    "1940",
    "Çöl Tilkisi",
    "dfsdfs",
    ["1"],
    ["1"],
    false,
    ["WW2"],
  ),
  Soldier("2", "Atatürk", "1881", "1938", "Kurucu", "sfdd", ["2"], [], true, [])
];
