import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warhistory/dummy.dart';

class SelectBattles extends StatelessWidget {
  SelectBattles({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Column(children: [
          Text("${text} Seçiniz"),
          ListView.builder(
              itemCount: battles.length,
              itemBuilder: ((context, index) {
                return Row(
                  children: [Text(battles[index].Name)],
                );
              }))
        ]),
      ),
    );
  }
}
