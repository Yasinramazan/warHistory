import 'package:flutter/material.dart';

class SelectSources extends StatelessWidget {
  SelectSources({Key? key}) : super(key: key);

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
                  Text("Kaynakları Giriniz"),
                  const Divider(
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .5,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: ((context, index) {
                          return TextFormField();
                        })),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
