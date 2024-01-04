// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:auto_titanic/utils/platform_handler/base_handler.dart';

class PlatformHandler extends BaseHandler {
  @override
  void enterFullScreen() {
    document.documentElement?.requestFullscreen();
  }

  @override
  void exitFullScreen() {
    document.exitFullscreen();
  }
}
