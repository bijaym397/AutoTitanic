import 'package:auto_titanic/utils/platform_handler/base_handler.dart';
import 'package:flutter/services.dart';

class PlatformHandler extends BaseHandler {
  @override
  void enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void exitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
}
