import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warhistory/Pages/AddingPages/AddSoldier.dart';

class SoldierList extends StatelessWidget {
  const SoldierList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSoldier()),
          );
        }),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
    );
  }
}
