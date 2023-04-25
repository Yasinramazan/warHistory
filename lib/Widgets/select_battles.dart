import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Theme/theme.dart';
import 'package:warhistory/dummy.dart';

import '../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';

class SelectBattles extends StatelessWidget {
  SelectBattles({Key? key}) : super(key: key) {
    for (var i = 0; i < battles.length; i++) {
      colors.add(Colors.white);
    }
    for (var i = 0; i < battles.length; i++) {
      selects.add(false);
    }
  }
  List<Color> colors = [];
  List<bool> selects = [];
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
                    child: BlocProvider(
                      create: (context) => SoldierBlocBloc(),
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
                                          Text(battles[index].Name),
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
                                          Text(battles[index].Name),
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
                  )
                ]),
          ),
        ),
      ),
    );
  }

  _changeColor(BuildContext context, int index) {
    colors[index] == Colors.green
        ? colors[index] = Colors.white
        : colors[index] = Colors.green;
    selects[index] == true ? selects[index] = false : selects[index] = true;
    context
        .read<SoldierBlocBloc>()
        .add(ChangeColor(colors: colors, index: index, isSelected: selects));
  }
}
