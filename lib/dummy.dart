import 'package:warhistory/Entities/Battles.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Entities/Wars.dart';

Soldier soldier = Soldier(
    "1",
    "Erwin Rommel",
    "1844",
    "1940",
    "Erwin Johannes Eugen Rommel (15 Kasım 1891, Stuttgart – 14 Ekim 1944, Ulm), II. Dünya Savaşı sırasında Alman Afrika Kolordusu komutanlığını da yapmış olan Alman mareşal. Kuzey Afrika'da İngiliz birliklerine karşı kazandığı başarılar nedeniyle Çöl Tilkisi (Wüstenfuchs, lakabıyla bilinir ve sadece askeri başarılarıyla değil rakiplerine karşı olan şövalyevari tutumuyla da hatırlanır." +
        "Rommel, Ulm'un 33 km kuzeyindeki Heidenheim kentinde doğdu. On dört yaşındayken bir arkadaşıyla birlikte tam ölçekte bir planör yapmayı başardılar. Genç Erwin'in mühendis olma düşüncesine karşın 1910 yılında babasının ısrarıyla 124. Württemberg Piyade Alayına subay adayı olarak katıldı ve kısa süre sonra da Danzig'deki Subay Hazırlama Okuluna gönderildi. Kasım 1911'de okuldan mezun olarak Ocak 1912'de Teğmenliğe atandı.",
    "dfsdfs",
    ["El Alamein", "Tobruk", "Tunus"],
    false,
    ["WW2"]);

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
    false,
    ["WW2"],
  ),
  Soldier("2", "Atatürk", "1881", "1938", "Kurucu", "sfdd", ["2"], true, [])
];
