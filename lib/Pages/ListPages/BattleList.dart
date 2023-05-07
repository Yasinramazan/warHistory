import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Pages/AddingPages/AddBattle.dart';
import 'package:warhistory/Pages/AddingPages/AddSoldier.dart';
import 'package:warhistory/Services/soldierService.dart';

import '../../Bloc/AddBattleBloc/bloc/battle_bloc.dart';
import '../../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';
import '../../Entities/Soldiers.dart';

class BattleList extends StatelessWidget {
  BattleList({Key? key}) : super(key: key);
  SoldiersService soldiersService = SoldiersService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BattleBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBattle()),
            );
          }),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<BattleBloc, BattleState>(
            builder: (context, state) {
              if (state is BattleInitialState) {
                context.read<BattleBloc>().add(ListBattleEvent(battles: []));

                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BattleListState) {
                return ListView.builder(
                    itemCount: state.battles.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(state.battles[index].Name),
                      );
                    }));
              } else {
                return Container();
              }
            },
          ),
        )),
      ),
    );
  }
}
