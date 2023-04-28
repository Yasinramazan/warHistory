import 'package:flutter/material.dart';

class TextValidator {
  static validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bu alanı doldurunuz';
    }
    return null;
  }
}

class TryCatch {
  static int tryCatch(Function(int) f) {
    int a = 0;
    try {
      Function(int) g = f;
      g(123);
      a = 1;
    } catch (e) {
      a = -1;
    }
    return a;
  }
}

class Snackbar {
  static showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
