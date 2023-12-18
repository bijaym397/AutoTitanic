import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/home/views/views.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';
part 'mixins/sell_vehicle_mixin.dart';

class HomeController extends GetxController with HomeAPIMixin, SellVehicleMixin {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  CommonController get commongController => Get.find<CommonController>();

  final Rx<AdvanceSearchType> _selectedAdvanceSearchType = AdvanceSearchType.allVehicle.obs;
  AdvanceSearchType get selectedAdvanceSearchType => _selectedAdvanceSearchType.value;
  set selectedAdvanceSearchType(AdvanceSearchType value) => _selectedAdvanceSearchType.value = value;

  var debouncer = Debouncer();

  // -------------------- Sell Variables -----------------

  var imageScrollController = ScrollController();

  var vehicleVideoTEC = TextEditingController();

  final RxBool _isLinkValid = false.obs;
  bool get isLinkValid => _isLinkValid.value;
  set isLinkValid(bool value) => _isLinkValid.value = value;

  bool showLocationPage = true;

  Vehicle? selectedVehicleCategory;

  String? selectedCountry;

  String? selectedState;

  var sellTitleTEC = TextEditingController();

  var sellDescriptionTEC = TextEditingController();

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

  final RxList<PlatformFile> _selectedImages = <PlatformFile>[].obs;
  List<PlatformFile> get selectedImages => _selectedImages;
  set selectedImages(List<PlatformFile> value) => _selectedImages.value = value;

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

      commongController.goToVehicleListing(vehicle, hover);
    } else {
      var (v, i) = _vehicleFromRoute();
      Utility.updateLater(() {
        commongController.selectedVehicle = v;
        commongController.selectedItem = i;
      });
    }
  }

  // ==================== DATA =====================

  final carsList = <List<List<String>>>[];

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

  void animateToLast() {
    imageScrollController.animateTo(
      imageScrollController.position.maxScrollExtent,
      duration: AppConstants.animationDuration,
      curve: Curves.easeInOut,
    );
  }

  void generateCarsData() {
    var total = AppConstants.featuredCarsCount + AppConstants.recentCarsCount;
    for (var i = 0; i < total; i++) {
      var carousel = <List<String>>[];
      for (var j = 0; j < AppConstants.carouselItemCount; j++) {
        var cars = <String>[];
        for (var k = 0; k < AppConstants.maxVehiclePerItem; k++) {
          cars.add(AssetConstants.car);
        }
        carousel.add(cars);
      }
      carsList.add(carousel);
    }
  }
  // ================= API CALLS ===================
}
