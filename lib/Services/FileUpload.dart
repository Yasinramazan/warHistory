import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerative {
  String? imagePath;
  XFile? imageItem;
  List<String>? imagePaths;
  FilePickerResult? filePickerResults;

  FilePickerative(
    this.imagePath,
    this.filePickerResults,
    this.imageItem,
    this.imagePaths,
  );
}
