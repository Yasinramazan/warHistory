import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Services/soldierService.dart';
import 'package:warhistory/Theme/theme.dart';
import 'package:warhistory/dummy.dart';

import '../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';

class SelectBattles extends StatelessWidget {
  SelectBattles({
    Key? key,
  }) : super(key: key) {
    for (var i = 0; i < battles.length; i++) {
      colors.add(Colors.white);
    }
    for (var i = 0; i < battles.length; i++) {
      selects.add(false);
    }
  }
  final soldierBloc = SoldierBlocBloc();
  List<Color> colors = [];
  List<bool> selects = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColorDark)),
          height: MediaQuery.of(context).size.height * .6,
          width: MediaQuery.of(context).size.width * .6,
          child: Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Muharebeleri Seçiniz"),
                  const Divider(
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .5,
                    child: BlocProvider.value(
                      value: soldierBloc,
                      child: ListView.builder(
                          itemCount: battles.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () => _changeColor(context, index),
                              child: BlocBuilder<SoldierBlocBloc,
                                  SoldierBlocState>(
                                builder: (context, state) {
                                  if (state is ChangeColorState) {
                                    return Container(
                                      color: state.colors[index],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            battles[index].Name,
                                            style: myTheme.textTheme.bodyText1,
                                          ),
                                          Checkbox(
                                              value: state.isSelected[index],
                                              onChanged: (value) {
                                                _changeColor(context, index);
                                              })
                                        ],
                                      ),
                                    );
                                  } else if (state is ChangeColorInitial) {
                                    return Container(
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            battles[index].Name,
                                            style: myTheme.textTheme.bodyText1,
                                          ),
                                          Checkbox(
                                              value: false,
                                              onChanged: (value) {
                                                _changeColor(context, index);
                                              })
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            );
                          })),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => addBattles(context),
                      child: Text("Tamam"))
                ]),
          ),
        ),
      ),
    );
  }

  void addBattles(BuildContext context) {
    for (var i = 0; i < battles.length; i++) {
      if (selects[i] == true) {
        GlobalSoldier.Battles.add(battles[i].Id);
      }
    }
    Navigator.pop(context);
  }

  _changeColor(BuildContext context, int index) {
    colors[index] == myTheme.highlightColor
        ? colors[index] = Colors.white
        : colors[index] = myTheme.highlightColor;
    selects[index] == true ? selects[index] = false : selects[index] = true;
    context
        .read<SoldierBlocBloc>()
        .add(ChangeColor(colors: colors, index: index, isSelected: selects));
  }
}
