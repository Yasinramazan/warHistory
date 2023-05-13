import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Services/soldierService.dart';
import 'package:warhistory/Theme/theme.dart';

import '../Bloc/AddSoldierBloc/bloc/source_bloc/bloc/source_bloc.dart';

class SelectSources extends StatelessWidget {
  SelectSources({Key? key}) : super(key: key);
  int count = 1;
  final soldierBloc = SourceBloc();
  List<TextEditingController> texts = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SafeArea(
        child: BlocProvider(
          create: (context) => SourceBloc(),
          child: Builder(builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .8,
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Kaynakları Giriniz"),
                      const Divider(
                        color: Colors.amber,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .4,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark)),
                        child: BlocBuilder<SourceBloc, SourceState>(
                          builder: (context, state) {
                            if (state is AddSourceTextFieldInitial) {
                              texts.add(TextEditingController());
                              return ListView.builder(
                                  itemCount: state.count,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Kaynak ${index + 1}",
                                              style:
                                                  myTheme.textTheme.bodyText1),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .9 /
                                                  2,
                                              child: TextFormField(
                                                  controller: texts[index],
                                                  style: myTheme
                                                      .textTheme.bodyText2)),
                                        ],
                                      ),
                                    );
                                  }));
                            } else if (state is AddSourceTextFieldState) {
                              texts.add(TextEditingController());

                              return ListView.builder(
                                  itemCount: state.count,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Kaynak  ${index + 1}",
                                            style: myTheme.textTheme.bodyText1,
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .9 /
                                                  2,
                                              child: TextFormField(
                                                controller: texts[index],
                                                style:
                                                    myTheme.textTheme.bodyText2,
                                              )),
                                        ],
                                      ),
                                    );
                                  }));
                            } else {
                              return Container(
                                color: Colors.green,
                              );
                            }
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () => addTextField(context),
                          icon: const Icon(Icons.add_box_sharp)),
                      ElevatedButton(
                          onPressed: () => addSource(context),
                          child: Text("Tamam"))
                    ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  void addSource(BuildContext context) {
    for (var element in texts) {
      if (element.text.isNotEmpty || element.text != null)
        GlobalSoldier.Sources!.add(element.text);
    }
    Navigator.pop(context);
  }

  addTextField(BuildContext context) {
    context.read<SourceBloc>().add(AddSourceEvent(count: count + 1));
    count++;
  }
}
