import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warhistory/Pages/AddingPages/AddSoldier.dart';
import 'package:warhistory/Services/soldierService.dart';

import '../../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';
import '../../Entities/Soldiers.dart';

class SoldierList extends StatelessWidget {
  SoldierList({Key? key}) : super(key: key);
  SoldiersService soldiersService = SoldiersService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshSoldierBloc(),
      child: Scaffold(
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
          child: BlocBuilder<RefreshSoldierBloc, SoldierBlocState>(
            builder: (context, state) {
              if (state is RefreshSoldierInitialState) {
                context.read<RefreshSoldierBloc>().add(RefreshSoldierEvent([]));
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RefreshSoldierPageState) {
                return ListView.builder(
                    itemCount: state.soldiers.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(state.soldiers[index].Name),
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
