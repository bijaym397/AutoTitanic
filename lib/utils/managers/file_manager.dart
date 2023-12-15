import 'dart:async';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:file_picker/file_picker.dart';

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

  static Future<List<PlatformFile>> pickImages() async {
    var largeImage = false;
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return [];
    }
    try {
      var files = <PlatformFile>[];
      for (var file in result.files) {
        var isAllowed = isUnderSize(bytes: file.bytes?.length ?? 0);
        if (isAllowed) {
          files.add(file);
        } else {
          largeImage = true;
        }
      }
      if (largeImage) {
        unawaited(Utility.showAlertDialog(
          ResponseModel.message(
            '1 or more selected images exceed maximum size limit',
          ),
        ));
      }
      return files;
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }

  static bool isUnderSize({
    required int bytes,
    double limit = 5.0,
  }) =>
      bytes < (limit * 1048576);
}
