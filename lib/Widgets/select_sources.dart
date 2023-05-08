import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Services/battleService.dart';
import 'package:warhistory/Services/soldierService.dart';
import 'package:warhistory/Theme/theme.dart';

import '../Bloc/AddSoldierBloc/bloc/source_bloc/bloc/source_bloc.dart';

class SelectSources extends StatelessWidget {
  SelectSources({Key? key, required this.select}) : super(key: key);
  int count = 1;
  int select;
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
                      Text("$_selectedText"),
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
                                          Text("$_getTextField ${index + 1}",
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
                                            "$_getTextField  ${index + 1}",
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
                          child: const Text("Tamam"))
                    ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  String? _getTextField() {
    if (select == 0) {
      return "Kaynak";
    } else if (select == 1) {
      return "Kazanan";
    } else if (select == 2) {
      return "Kaybeden";
    }
    return "";
  }

  String? _selectedText() {
    if (select == 0) {
      return "Kaynakları Seçiniz";
    } else if (select == 1) {
      return "Kazananları Seçiniz";
    } else if (select == 2) {
      return "Kaybedenleri Seçiniz";
    }
    return "";
  }

  void addSource(BuildContext context) {
    if (select == 0) {
      for (var element in texts) {
        if (element.text.isNotEmpty || element.text != null)
          GlobalSoldier.Sources!.add(element.text);
      }
    } else if (select == 1) {
      for (var element in texts) {
        if (element.text.isNotEmpty || element.text != null)
          GlobalBattle.Winners.add(element.text);
      }
    } else if (select == 2) {
      for (var element in texts) {
        if (element.text.isNotEmpty || element.text != null)
          GlobalBattle.Losers.add(element.text);
      }
    }

    Navigator.pop(context);
  }

  addTextField(BuildContext context) {
    context.read<SourceBloc>().add(AddSourceEvent(count: count + 1));
    count++;
  }
}
