import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/AddSoldierBloc/bloc/source_bloc/bloc/source_bloc.dart';

class SelectSources extends StatelessWidget {
  SelectSources({Key? key}) : super(key: key);
  int count = 1;
  final soldierBloc = SourceBloc();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SafeArea(
        child: BlocProvider(
          create: (context) => SourceBloc(),
          child: Builder(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).primaryColorDark)),
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width * .6,
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Kaynakları Giriniz"),
                      const Divider(
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width * .5,
                        child: BlocBuilder<SourceBloc, SourceState>(
                          builder: (context, state) {
                            if (state is AddSourceTextFieldInitial) {
                              return ListView.builder(
                                  itemCount: state.count,
                                  itemBuilder: ((context, index) {
                                    return TextFormField();
                                  }));
                            } else if (state is AddSourceTextFieldState) {
                              return ListView.builder(
                                  itemCount: state.count,
                                  itemBuilder: ((context, index) {
                                    return TextFormField();
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
                          icon: const Icon(Icons.add_box_sharp))
                    ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  addTextField(BuildContext context) {
    context.read<SourceBloc>().add(AddSourceEvent(count: count + 1));
    count++;
  }
}
