import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';

class CommonController extends GetxController with CommonAPIMixin {
  CommonController(this._viewModel);
  final CommonViewModel _viewModel;

  final Rx<Vehicle?> _hoveredVehicle = Rx<Vehicle?>(null);
  Vehicle? get hoveredVehicle => _hoveredVehicle.value;
  set hoveredVehicle(Vehicle? value) => _hoveredVehicle.value = value;

  final Rx<Vehicle?> _selectedVehicle = Rx<Vehicle?>(null);
  Vehicle? get selectedVehicle => _selectedVehicle.value;
  set selectedVehicle(Vehicle? value) => _selectedVehicle.value = value;

  final Rx<HoverItem?> _hoveredItem = Rx<HoverItem?>(null);
  HoverItem? get hoveredItem => _hoveredItem.value;
  set hoveredItem(HoverItem? value) => _hoveredItem.value = value;

  final Rx<HoverItem?> _selectedItem = Rx<HoverItem?>(null);
  HoverItem? get selectedItem => _selectedItem.value;
  set selectedItem(HoverItem? value) => _selectedItem.value = value;

  final Rx<OverlayState?> _hoverOverlayState = Rx<OverlayState?>(null);
  OverlayState? get hoverOverlayState => _hoverOverlayState.value;
  set hoverOverlayState(OverlayState? value) => _hoverOverlayState.value = value;

  final Rx<OverlayEntry?> _hoverOverlayEntry = Rx<OverlayEntry?>(null);
  OverlayEntry? get hoverOverlayEntry => _hoverOverlayEntry.value;
  set hoverOverlayEntry(OverlayEntry? value) => _hoverOverlayEntry.value = value;

  final Rx<Social?> _selectedSocial = Rx<Social?>(null);
  Social? get selectedSocial => _selectedSocial.value;
  set selectedSocial(Social? value) => _selectedSocial.value = value;

  // ---------------- Data --------------------

  final footer1 = const <LinkModel>[
    LinkModel(
      label: AppStrings.aboutUs,
      route: AboutUsView.route,
    ),
    LinkModel(
      label: AppStrings.contactUs,
      route: ContactUsView.route,
    ),
    LinkModel(
      label: AppStrings.privacyPolicy,
      route: PrivacyView.route,
    ),
    LinkModel(
      label: AppStrings.welcome,
      route: WelcomeView.route,
    ),
    LinkModel(
      label: AppStrings.termsConditions,
      route: TermsConditionsView.route,
    ),
  ];

  final footer2 = const <LinkModel>[
    LinkModel(
      label: AppStrings.postingNewAdvert,
      route: PostingAdView.route,
    ),
    LinkModel(
      label: AppStrings.buyingNew,
      route: BuyNewVehicleView.route,
    ),
    LinkModel(
      label: AppStrings.buyingUsed,
      route: BuyUsedVehicleView.route,
    ),
    LinkModel(
      label: AppStrings.safetyNotice,
      route: SafetyNoticeView.route,
    ),
    LinkModel(
      label: AppStrings.safetyCentre,
      route: SecurityCentreView.route,
    ),
  ];

  // ---------------- Functions -----------------

  void goToVehicleListing(Vehicle vehicle, HoverItem hoverItem) {
    Utility.updateLater(() {
      closeOverlay(true);
      selectedVehicle = vehicle;
      selectedItem = hoveredItem;
      RouteManagement.goToListing(vehicle, hoverItem);
    });
  }

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
      hoveredVehicle = null;
      hoveredItem = null;
    }
    if (hoverOverlayEntry == null) {
      return;
    }

    hoverOverlayEntry?.remove();
    hoverOverlayEntry = null;
  }
}
