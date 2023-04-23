import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:warhistory/Entities/Soldiers.dart';
import 'package:warhistory/Theme/theme.dart';

import '../../Services/FileUpload.dart';

class AddSoldier extends StatefulWidget {
  const AddSoldier({Key? key}) : super(key: key);

  @override
  State<AddSoldier> createState() => _AddSoldierState();
}

class _AddSoldierState extends State<AddSoldier> {
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
                              'Hello World',
                            ),
                          ),
                          IconButton(
                              onPressed: () async {},
                              icon: Icon(Icons.file_upload_outlined))
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Muharebe Seç',
                            ),
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("+"))
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                            child: Text(
                              'Kaynakları Seç',
                            ),
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("+"))
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

  void _updateItems(FilePicker model) {
    setState(() {
      var imagePath = model.imagePath;
      var imagePaths = model.imagePaths;
      var filePickerResults = model.filePickerResults;
    });
  }
}
