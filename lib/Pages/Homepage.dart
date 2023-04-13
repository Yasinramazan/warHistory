import 'package:flutter/material.dart';
import 'package:warhistory/Services/SoldierService.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  //SoldierService ss = SoldierService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [Text("ss.asyncGetAllSoldiers()")]),
      ),
    );
  }
}
