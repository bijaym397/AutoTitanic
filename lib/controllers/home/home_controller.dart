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

  final contactList = const <ContactModel>[
    ContactModel(
      label: 'Address',
      data: '220E Front St. Burlington NC 215',
      icon: Icons.location_on_rounded,
    ),
    ContactModel(
      label: 'Phone',
      data: '(007) 123 456 7890',
      icon: Icons.call_rounded,
    ),
    ContactModel(
      label: 'Email',
      data: 'support@example.com',
      icon: Icons.email_rounded,
    ),
    ContactModel(
      label: 'Fax',
      data: '(007) 123 456 7890',
      icon: Icons.fax_rounded,
    ),
  ];

  var informationList = <ContactModel>[
    const ContactModel(
      label: 'OPENING HOURS',
      data:
          'Voluptatem accusanoremque sed ut perspiciatis unde omnis iste natus error sit laudantium, totam rem aperiam.',
      icon: Icons.watch_later_outlined,
    ),
    const ContactModel(
      label: 'OUR SUPPORT CENTER',
      data:
          'Iste natus error sit sed ut perspiciatis unde omnis voluptatem laudantium, totam rem aperiam.',
      icon: Icons.sports_soccer_rounded,
    ),
    const ContactModel(
      label: 'SOME INFORMATION',
      data:
          'Totam rem aperiam sed ut perspiciatis unde omnis iste natus error sit voluptatem laudantium.',
      icon: Icons.watch_later_outlined,
    ),
  ];

  var brandsList = const <BrandModel>[
    BrandModel(name: 'BMW', icon: AssetConstants.bmw),
    BrandModel(name: 'HONDA', icon: AssetConstants.honda),
    BrandModel(name: 'HYUNDAI', icon: AssetConstants.hyundai),
    BrandModel(name: 'LEXUS', icon: AssetConstants.lexus),
    BrandModel(name: 'MERCEDES', icon: AssetConstants.mercedes),
    BrandModel(name: 'MITSUBISHI', icon: AssetConstants.mitsubishi),
    BrandModel(name: 'PORSCHE', icon: AssetConstants.porsche),
    BrandModel(name: 'TOYOTA', icon: AssetConstants.toyota),
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
