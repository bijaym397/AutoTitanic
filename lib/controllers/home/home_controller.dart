import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/home/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';
part 'mixins/sell_vehicle_mixin.dart';

class HomeController extends GetxController with HomeAPIMixin, SellVehicleMixin {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

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

  // -------------------- Sell Variables -----------------

  bool showLocationPage = true;

  Vehicle? selectedVehicleCategory;

  String? selectedCountry;

  String? selectedState;

  SellerType? selectedSellerType;

  var sellTitleTEC = TextEditingController();

  String? selectedCarCondition;

  String? selectedMake;

  String? selectedModel;

  String? selectedVariant;

  var sellPriceTEC = TextEditingController();

  String? selectedYear;

  var sellMileageTEC = TextEditingController();

  String? selectedGearBox;

  String? selectedFuelType;

  String? selectedBodyStyle;

  String? selectedBodyType;

  String? selectedEngineSize;

  String? selectedDoor;

  String? selectedExteriorColor;

  String? selectedInteriorColor;

  String? selectedSeat;

  String? selectedDriverPosition;

  String? selectedBootSpace;

  String? selectedAcceleration;

  String? selectedFuelConsumption;

  String? selectedCO2Emission;

  // ==================== INIT =====================

  VehicleHover _vehicleFromRoute() {
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

  void checkRoute() {
    var uri = Uri.base.toString();
    var route = 'home';
    var isHome = uri.contains(route);
    if (isHome) {
      var (vehicle, hover) = _vehicleFromRoute();

      goToVehicleListing(vehicle, hover);
    } else {
      var (v, i) = _vehicleFromRoute();
      Utility.updateLater(() {
        selectedVehicle = v;
        selectedItem = i;
      });
    }
  }

  // ==================== DATA =====================

  final carsList = <List<List<String>>>[];

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
      data: 'Voluptatem accusanoremque sed ut perspiciatis unde omnis iste natus error sit laudantium, totam rem aperiam.',
      icon: Icons.watch_later_outlined,
    ),
    const ContactModel(
      label: 'OUR SUPPORT CENTER',
      data: 'Iste natus error sit sed ut perspiciatis unde omnis voluptatem laudantium, totam rem aperiam.',
      icon: Icons.sports_soccer_rounded,
    ),
    const ContactModel(
      label: 'SOME INFORMATION',
      data: 'Totam rem aperiam sed ut perspiciatis unde omnis iste natus error sit voluptatem laudantium.',
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

  // ================= FUNCTIONS ===================

  void goToVehicleListing(Vehicle vehicle, HoverItem hoverItem) {
    Utility.updateLater(() {
      closeOverlay(true);
      selectedVehicle = vehicle;
      selectedItem = hoveredItem;
      RouteManagement.goToListing(vehicle, hoverItem);
    });
  }

  void generateCarsData() {
    var total = AppConstants.featuredCarsCount + AppConstants.recentCarsCount;
    for (var i = 0; i < total; i++) {
      var carousel = <List<String>>[];
      for (var j = 0; j < AppConstants.carouselItemCount; j++) {
        var cars = <String>[];
        for (var k = 0; k < AppConstants.carsPerItem; k++) {
          cars.add(AssetConstants.car);
        }
        carousel.add(cars);
      }
      carsList.add(carousel);
    }
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

  // ================= API CALLS ===================
}
