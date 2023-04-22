import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectBattles extends StatelessWidget {
  SelectBattles({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Column(children: [
          Text("${text} Seçiniz"),
        ]),
      ),
    );
  }
}
