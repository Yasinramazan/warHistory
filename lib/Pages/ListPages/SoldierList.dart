import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warhistory/Pages/AddingPages/AddSoldier.dart';
import 'package:warhistory/Services/soldierService.dart';

import '../../Entities/Soldiers.dart';

class SoldierList extends StatelessWidget {
  SoldierList({Key? key}) : super(key: key);
  SoldiersService soldiersService = SoldiersService();

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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<Soldier>>(
          future: soldiersService.getSoldiers(),
          builder: (context, AsyncSnapshot<List<Soldier>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].Name),
                    );
                  }));
            } else {
              return Text("Hiç Veri Yok");
            }
          },
        ),
      )),
    );
  }
}
