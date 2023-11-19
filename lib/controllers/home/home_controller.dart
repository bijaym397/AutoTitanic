import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';

class HomeController extends GetxController with HomeAPIMixin {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  final Rx<Vehicle?> _selectedVehicle = Rx<Vehicle?>(null);
  Vehicle? get selectedVehicle => _selectedVehicle.value;
  set selectedVehicle(Vehicle? value) => _selectedVehicle.value = value;

  final Rx<OverlayState?> _hoverOverlayState = Rx<OverlayState?>(null);
  OverlayState? get hoverOverlayState => _hoverOverlayState.value;
  set hoverOverlayState(OverlayState? value) =>
      _hoverOverlayState.value = value;

  final Rx<OverlayEntry?> _hoverOverlayEntry = Rx<OverlayEntry?>(null);
  OverlayEntry? get hoverOverlayEntry => _hoverOverlayEntry.value;
  set hoverOverlayEntry(OverlayEntry? value) =>
      _hoverOverlayEntry.value = value;

  // ----------------- FUNCTIONS -------------------

  void showOverlay({
    required BuildContext context,
    required BuildContext itemContext,
    required Widget child,
    required LayerLink layerLink,
  }) {
    final renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox!.size;
    hoverOverlayState = Overlay.of(context);
    hoverOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height),
          child: Material(child: child),
        ),
      ),
    );
    hoverOverlayState!.insert(hoverOverlayEntry!);
  }

  void closeOverlay([bool removeSelectedNav = true]) {
    if (removeSelectedNav) {
      selectedVehicle = null;
    }
    if (hoverOverlayEntry == null) {
      return;
    }

    hoverOverlayEntry?.remove();
    hoverOverlayEntry = null;
  }

  // ----------------- API CALLS -------------------
}
