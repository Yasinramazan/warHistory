import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Theme/theme.dart';
import 'package:warhistory/Widgets/select_battles.dart';
import 'package:warhistory/Widgets/select_sources.dart';

import '../../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';
import '../../Bloc/AddSoldierBloc/bloc/source_bloc/bloc/source_bloc.dart';

class SoldierView extends StatefulWidget {
  const SoldierView({Key? key}) : super(key: key);

  @override
  State<SoldierView> createState() => _AddSoldierState();
}

class _AddSoldierState extends State<SoldierView> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  bool _value = false;
  String name = "";
  String birthday = "";
  String deathday = "";
  String explanation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 3 / 2,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: name,
                        decoration: InputDecoration(labelText: "İsim"),
                      ),
                      TextFormField(
                          initialValue: birthday,
                          decoration: const InputDecoration(
                              labelText: "Doğum Tarihi",
                              hintText: "##/##/####"),
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [maskFormatter]),
                      TextFormField(
                          initialValue: deathday,
                          decoration: const InputDecoration(
                              labelText: "Ölüm Tarihi", hintText: "##/##/####"),
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [maskFormatter]),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Resim Seçiniz',
                            ),
                          ),
                          IconButton(
                              onPressed: () => _updateItems(),
                              icon: Icon(Icons.file_upload_outlined))
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Muharebe Seçiniz',
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () => alertDialog(context, true),
                              child: Text("+"))
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Kaynakları Seçiniz',
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () => alertDialog(context, false),
                              child: Text("+"))
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Devlet Adamı',
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            child: Checkbox(
                              activeColor: myTheme.primaryColorDark,
                              value: _value,
                              onChanged: (newValue) async {
                                setState(() {
                                  _value = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        initialValue: explanation,
                        maxLines: 15,
                        decoration: InputDecoration(labelText: "Açıklama"),
                      ),
                      ElevatedButton(
                          onPressed: () => saveSoldier(), child: Text("Kaydet"))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveSoldier() {
    Soldier soldier =
        Soldier("", name, birthday, birthday, explanation, "", [], _value, []);
  }

  void alertDialog(BuildContext context, bool a) {
    if (a == true) {
      showDialog(
          context: context,
          builder: ((context) {
            return SelectBattles();
          }));
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return SelectSources();
          }));
    }
  }

  void _updateItems() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result == null) {
    } else {
      final file = result.files.first;
      final newFile = await saveDocument(file);
    }
  }

  Future<File> saveDocument(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");
    return File(file.path!).copy(newFile.path);
  }
}

class AddSoldier extends StatelessWidget {
  const AddSoldier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SourceBloc>(
          create: (BuildContext context1) => SourceBloc(),
        ),
        BlocProvider(
          create: (context2) => SoldierBlocBloc(),
        ),
      ],
      child: SoldierView(),
    );
  }
}
