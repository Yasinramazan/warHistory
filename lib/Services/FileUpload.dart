import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePicker {
  String? imagePath;
  XFile? imageItem;
  List<String>? imagePaths;
  FilePickerResult? filePickerResults;

  FilePicker(
    this.imagePath,
    this.filePickerResults,
    this.imageItem,
    this.imagePaths,
  );
}
