import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warhistory/Entities/Soldiers.dart';

import '../Services/soldierService.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<String> content = [
    "Askerler",
    "Devlet Adamları",
    "Savaşlar",
    "Muharebeler",
    "Haritalar",
    "Antlaşmalar"
  ];
  List<String> assets = [
    "Icons/general/napoleon.png",
    "Icons/statesman/wreath.png",
    "Icons/war/explosion.png",
    "Icons/battle/sword.png",
    "Icons/map/world.png",
    "Icons/treaty/writing.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView.builder(
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(content[index]),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset(assets[index]),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
