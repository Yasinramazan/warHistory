import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Services/Validator.dart';
import 'package:warhistory/Services/soldierService.dart';
import 'package:warhistory/Theme/theme.dart';
import 'package:warhistory/Widgets/select_battles.dart';
import 'package:warhistory/Widgets/select_sources.dart';

import '../../Bloc/AddSoldierBloc/bloc/soldier_bloc_bloc.dart';
import '../../Bloc/AddSoldierBloc/bloc/source_bloc/bloc/source_bloc.dart';

class BattleView extends StatefulWidget {
  const BattleView({Key? key}) : super(key: key);

  @override
  State<BattleView> createState() => _addBattlePage();
}

class _addBattlePage extends State<BattleView> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  SoldiersService _soldiersService = SoldiersService();
  TextEditingController nameController = TextEditingController();
  TextEditingController deathdayController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  File image = File("");
  Soldier refSoldier = Soldier(
      Id: "",
      Name: "",
      Birthday: "",
      Deathday: "",
      Explanation: "",
      Photo: "",
      Battles: [],
      Stateman: false,
      Sources: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 3 / 2,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: "İsim"),
                        validator: (value) => TextValidator.validator(value),
                      ),
                      
                      /*Row(
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
                      ),*/

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
                              onPressed: () =>
                                  alertWinnersDialog(context, false),
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
                        controller: explanationController,
                        maxLines: 15,
                        decoration: InputDecoration(labelText: "Açıklama"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _saveSoldier();
                          },
                          child: Text("Kaydet"))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveSoldier() {
    if (_formKey.currentState!.validate()) {
      GlobalSoldier.Name = nameController.text;
      GlobalSoldier.Birthday = birthdayController.text;
      GlobalSoldier.Deathday = deathdayController.text;
      GlobalSoldier.Explanation = explanationController.text;
      GlobalSoldier.Stateman = _value;
      _soldiersService.setSoldier(GlobalSoldier);
      int a = _soldiersService.saveSoldier();
      if (a == 1) {
        Snackbar.showSnackbar(context, "Kayıt Başarılı");
        Navigator.pop(context, true);
        context.read<RefreshSoldierBloc>().add(RefreshSoldierEmptyEvent([]));
      } else {
        Snackbar.showSnackbar(context, "Bir hata oluştu, kaydetme başarısız");
      }
    }
  }

  void alertWinnersDialog(BuildContext context, bool a) {
    showDialog(
        context: context,
        builder: ((context) {
          return SelectSources();
        }));
  }
}

class AddBattle extends StatelessWidget {
  const AddBattle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BattleView();
  }
}
