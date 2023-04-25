class TextValidator {
  static validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bu alanı doldurunuz';
    }
    return null;
  }
}
