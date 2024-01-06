import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

part 'mixins/api_mixin.dart';
part 'mixins/sell_vehicle_mixin.dart';

class HomeController extends GetxController with SellVehicleMixin, HomeAPIMixin {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  CommonController get commonController => Get.find<CommonController>();

  final Rx<AdvanceSearchType> _selectedAdvanceSearchType = AdvanceSearchType.allVehicle.obs;
  AdvanceSearchType get selectedAdvanceSearchType => _selectedAdvanceSearchType.value;
  set selectedAdvanceSearchType(AdvanceSearchType value) => _selectedAdvanceSearchType.value = value;

  var debouncer = Debouncer();

  bool isFullScreen = false;

  DropDownModel? selectedFilterCountry;

  DropDownModel? selectedFilterBrand;

  DropDownModel? selectedFilterModel;

  num? selectedFilterMinPrice;

  num? selectedFilterMaxPrice;

  // -------------------- Sell Variables -----------------

  var imageScrollController = ScrollController();

  var vehicleVideoTEC = TextEditingController();

  final Rx<String?> _videoLinkError = Rx<String?>(null);
  String? get videoLinkError => _videoLinkError.value;
  set videoLinkError(String? value) => _videoLinkError.value = value;

  final RxBool _isValidatingLink = false.obs;
  bool get isValidatingLink => _isValidatingLink.value;
  set isValidatingLink(bool value) => _isValidatingLink.value = value;

  bool showLocationPage = true;

  Vehicle? selectedVehicleCategory;

  DropDownModel? selectedCountry;

  DropDownModel? selectedCity;

  var sellTitleTEC = TextEditingController();

  var sellDescriptionTEC = QuillEditorController();

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

  List<CountryModel> countries = [];

  List<CountryModel> cities = [];

  // ==================== INIT =====================

  List<DropDownModel> get countryList => countries
      .map((e) => DropDownModel(
            id: e.id,
            label: e.name,
          ))
      .toList();

  List<DropDownModel> get cityList => cities
      .map((e) => DropDownModel(
            id: e.id,
            label: e.name,
          ))
      .toList();

  void checkRoute() {
    var uri = Uri.base.toString();
    var route = 'home';
    var isHome = uri.contains(route);
    if (isHome) {
      var (vehicle, hover) = Utility.vehicleFromRoute();

      commonController.goToVehicleListing(vehicle, hover);
    } else {
      var (v, i) = Utility.vehicleFromRoute();
      Utility.updateLater(() {
        commonController.selectedVehicle = v;
        commonController.selectedItem = i;
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

  // ================= FUNCTIONS ===================

  void onFilterCountryChanged(DropDownModel? country) async {
    selectedFilterCountry = country;
    update([FilterSection.updateId]);
  }

  void onFilterBrandChanged(DropDownModel? brand) async {
    if (brand == null) {
      return;
    }
    selectedFilterBrand = brand;
    selectedFilterModel = null;
    update([FilterSection.updateId]);
    await _commonController.getModels(brand.id);
  }

  void onFilterModelChanged(DropDownModel? model) async {
    if (model == null) {
      return;
    }
    selectedFilterModel = model;
    update([FilterSection.updateId]);
  }

  void onFilterMinPriceChanged(num? price) async {
    if (price == null) {
      return;
    }
    selectedFilterMinPrice = price;
    update([FilterSection.updateId]);
  }

  void onFilterMaxPriceChanged(num? price) async {
    if (price == null) {
      return;
    }
    selectedFilterMaxPrice = price;
    update([FilterSection.updateId]);
  }

  void resetFilters() {
    selectedFilterCountry = null;
    selectedFilterBrand = null;
    update([FilterSection.updateId]);
  }

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
}
