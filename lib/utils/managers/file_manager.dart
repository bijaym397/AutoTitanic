import 'package:auto_titanic/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FileManager {
  const FileManager._();
  // static Future<XFile?> pickVideo() async {
  //   await _checkPermission();

  //   var file = await _picker.pickVideo(source: ImageSource.gallery);

  //   if (file == null) {
  //     return null;
  //   }

  //   try {
  //     return XFile(file.path);
  //   } catch (e, st) {
  //     AppLog.error(e, st);
  //     return null;
  //   }
  // }

  static Future<List<XFile>> pickImages() async {
    var file = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      withData: true,
    );
    if (file == null || file.files.isEmpty) {
      return [];
    }
    try {
      var files = <XFile>[];
      for (var image in file.files) {
        files.add(XFile.fromData(image.bytes!));
      }
      return files;
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }
}
