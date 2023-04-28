import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warhistory/Services/soldierService.dart';
import 'package:warhistory/dummy.dart';

class SoldierPage extends StatelessWidget {
  SoldierPage({Key? key}) : super(key: key);
  SoldiersService _soldiersService = SoldiersService();
  @override
  Widget build(BuildContext context) {
    final soldier = _soldiersService.getSoldier();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.blue,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(soldier.Name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(soldier.Birthday), Text(soldier.Deathday)],
                  ),
                  soldier.Stateman == true
                      ? Text("Asker ve Devlet Adamı")
                      : Text("Asker")
                ],
              ),
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .1,
              color: Colors.amber[900],
            ),
            const Text("Muharebeler"),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).primaryColorDark)),
              height: MediaQuery.of(context).size.height * .2,
              child: ListView.builder(
                  itemExtent: 30,
                  itemCount: soldier.Battles!.length,
                  itemBuilder: ((context, index) {
                    return Text(soldier.Battles![index]);
                  })),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Açıklama"),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Theme.of(context).primaryColorDark)),
                child: Text(soldier.Explanation)),
            const SizedBox(
              height: 10,
            ),
            const Text("Kaynaklar"),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).primaryColorDark)),
              height: MediaQuery.of(context).size.height * .2,
              child: ListView.builder(
                  itemExtent: 30,
                  itemCount: soldier.Sources!.length,
                  itemBuilder: ((context, index) {
                    return Text(soldier.Sources![index]);
                  })),
            )
          ]),
        ),
      )),
    );
  }
}
