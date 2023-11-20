import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/home/views/views.dart';
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

  final Rx<Social?> _selectedSocial = Rx<Social?>(null);
  Social? get selectedSocial => _selectedSocial.value;
  set selectedSocial(Social? value) => _selectedSocial.value = value;

  // -------------------- DATA ---------------------

  final footer1 = <LinkModel>[
    const LinkModel(
      label: AppStrings.aboutUs,
      route: AboutUsView.route,
    ),
    const LinkModel(
      label: AppStrings.contactUs,
      route: ContactUsView.route,
    ),
    const LinkModel(
      label: AppStrings.privacyPolicy,
      route: PrivacyView.route,
    ),
    const LinkModel(
      label: AppStrings.welcome,
      route: WelcomeView.route,
    ),
    const LinkModel(
      label: AppStrings.termsConditions,
      route: TermsConditionsView.route,
    ),
  ];

  final footer2 = <LinkModel>[
    const LinkModel(
      label: AppStrings.postingNewAdvert,
      route: PostingAdView.route,
    ),
    const LinkModel(
      label: AppStrings.buyingNew,
      route: BuyNewVehicleView.route,
    ),
    const LinkModel(
      label: AppStrings.buyingUsed,
      route: BuyNewVehicleView.route,
    ),
    const LinkModel(
      label: AppStrings.safetyNotice,
      route: SafetyNoticeView.route,
    ),
    const LinkModel(
      label: AppStrings.safetyCentre,
      route: SecurityCentreView.route,
    ),
  ];

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
