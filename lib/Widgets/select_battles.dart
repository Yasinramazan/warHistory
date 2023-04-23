import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warhistory/Theme/theme.dart';
import 'package:warhistory/dummy.dart';

class SelectBattles extends StatelessWidget {
  SelectBattles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColorDark)),
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .6,
          child: Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Muharebeleri Seçiniz"),
                  const Divider(
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .5,
                    child: ListView.builder(
                        itemCount: battles.length,
                        itemBuilder: ((context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(battles[index].Name),
                              Checkbox(value: false, onChanged: (value) {})
                            ],
                          );
                        })),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
