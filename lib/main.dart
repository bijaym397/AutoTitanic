import 'dart:async';

import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await _setup();
  setPathUrlStrategy();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DeviceConfig()).init();
  Get.lazyPut(SharedPreferencesManager.new);
  await Future.wait([
    AppConfig.init(
      const EnvConfig(
        appTitle: AppConstants.appName,
        appFlavor: AppFlavor.dev,
      ),
    ),
    Get.put<DBWrapper>(DBWrapper()).init(),
  ]);
  Get.put<ApiWrapper>(ApiWrapper());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple),
        getPages: AppPages.pages,
        initialRoute: AppPages.initial,
      );
}
