import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class EnvConfig {
  const EnvConfig({
    required this.appTitle,
    this.theme,
    this.themeMode,
    required this.appFlavor,
    this.commConfig,
  });

  final String appTitle;
  final ThemeData? theme;
  final ThemeMode? themeMode;
  final AppFlavor appFlavor;
  final CommunicationConfig? commConfig;
}
