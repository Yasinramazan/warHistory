import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:warhistory/Pages/Homepage.dart';
import 'package:warhistory/Theme/theme.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: myTheme, home: Home());
  }
}
