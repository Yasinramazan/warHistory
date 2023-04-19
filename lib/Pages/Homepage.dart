import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warhistory/Services/SoldierService.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Future getSoldiers() async {
    await FirebaseFirestore.instance
        .collection("Soldiers")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    getSoldiers();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Text(
            "data",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ElevatedButton(onPressed: () {}, child: Text("fdssfad"))
        ]),
      ),
    );
  }
}
