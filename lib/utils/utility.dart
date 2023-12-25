import 'dart:convert';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  const Utility._();

  static InternetConnection? $connection;

  static InternetConnection get _connection {
    $connection ??= InternetConnection();
    return $connection!;
  }

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static List<TextInputFormatter> numberFormatters = [
    FilteringTextInputFormatter.digitsOnly,
  ];

  /// Returns true if the internet connection is available.
  static Future<bool> get isNetworkAvailable async => await _connection.hasInternetAccess;

  static void updateLater(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 10), () {
        callback();
      });
    });
  }

  static VehicleHover vehicleFromRoute() {
    var uri = Uri.base.toString();
    var list = uri.split('/');
    var data = <String>[];
    var vehicles = Vehicle.values.map((e) => e.path);
    var items = HoverItem.values.map((e) => e.path);
    for (var i in list) {
      if (vehicles.contains(i) || items.contains(i)) {
        data.add(i);
      }
    }
    var v = Vehicle.fromRoute(
      data.firstWhere((e) => vehicles.contains(e), orElse: () => Vehicle.cars.path),
    );
    var h = HoverItem.fromRoute(
      data.firstWhere((e) => items.contains(e), orElse: () => HoverItem.used.path),
    );
    return (v, h);
  }

  static Future<T?> openBottomSheet<T>(
    Widget child, {
    Color? backgroundColor,
    bool isDismissible = true,
    ShapeBorder? shape,
  }) async =>
      await Get.bottomSheet<T>(
        child,
        barrierColor: Colors.black.withOpacity(0.7),
        backgroundColor: backgroundColor,
        isDismissible: isDismissible,
        shape: shape,
        isScrollControlled: true,
      );

  static Future<TimeOfDay> pickTime({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async =>
      (await showTimePicker(
        context: context,
        initialTime: initialTime,
        initialEntryMode: TimePickerEntryMode.inputOnly,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        ),
      )) ??
      initialTime;

  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      try {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } catch (e, st) {
        var path = url.split('?').first;
        AppLog.error('$e\n$path', st);
      }
    }
  }

  /// Show loader
  static void showLoader() async {
    await Get.dialog(
      const AppLoader(),
      barrierDismissible: false,
    );
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  static Future<void> showDialog({
    required Widget dialog,
  }) =>
      Get.dialog(
        Material(child: dialog),
      );

  static Future<void> showOverlay({
    required BuildContext context,
    required Widget dialog,
  }) =>
      Get.dialog(
        Material(child: dialog),
      );

  /// Show error dialog from response model
  static Future<void> showAlertDialog(
    ResponseModel data, [
    bool isSuccess = false,
    String? title,
  ]) async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: AppText(
          title ?? (isSuccess ? 'Success' : 'Error'),
        ),
        content: AppText(
          jsonDecode(data.data)['message'] as String,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const AppText(
              'Okay',
              isSelectable: false,
              // style: Styles.black16,
            ),
          ),
        ],
      ),
    );
  }

  /// Show info dialog
  static void showInfoDialog(
    String message,
  ) async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: const AppText('Info'),
        content: AppText(
          message,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            child: const AppText('Okay'),
          ),
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }
}
