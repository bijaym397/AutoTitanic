import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/foundation.dart';

/// `AppConstants` is a singleton class with all static variables.
///
/// It contains all constants that are to be used within the project
///
class AppConstants {
  const AppConstants._();

  static const String appName = 'AutoTitanic';

  static const Duration timeOutDuration = Duration(seconds: 90);

  static const Duration animationDuration = Duration(milliseconds: 300);

  static const Duration fastAnimationDuration = Duration(milliseconds: 200);

  static const int maxFileSize = 5; // MB
  static const int bytesToMegaBytes = 1048576;
  static const int maxFileSizeInBytes = 5242880;

  static const List<int> pageLimitList = [25, 50, 75, 100];

  static const double maxMobileWidth = 768;
  static const double maxTabletWidth = 1200;
  static const double maxBigTabletWidth = 1500;
  static const double maxDesktopWidth = 1900;

  static int get featuredCarsCount => kDebugMode ? 1 : 6;
  static int get recentCarsCount => kDebugMode ? 1 : 12;
  static const int carouselItemCount = 3;
  static const int maxVehiclePerItem = 6;

  static const double carCardAspectRatio = 1 / 1.2;
  static double get carCardWidth => 333;
  static double get carouselHeight => 400;

  static List<String> carConditions = HoverItem.selectableValues.map((e) => e.prefix).toList();

  static const List<String> variantList = ['110di', '120v', 'SE', 'Sports'];

  static const List<String> yearList = [
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
  ];

  static const List<String> bodyStyle = [
    'Camper',
    'Convertible',
    'Estate',
    'Hatchback',
    'SUV',
    'Window Van',
  ];

  static List<String> gearTypeList = GearType.values.map((e) => e.label).toList();

  static const List<String> engineSizeList = [
    '0L',
    '1.0L',
    '1.2L',
    '1.4L',
    '1.6L',
    '1.8L',
    '2.0L',
    '2.2L',
    '2.4L',
    '2.6L',
    '2.8L',
    '3.0L',
    '3.5L',
    '4.0L',
    '4.5L',
    '5.0L',
    '5.5L',
    '6.0L',
    '6.5L',
    '7.0L',
  ];

  static const List<String> fuelConsumptionList = [
    '30+mpg',
    '40+mpg',
    '50+mpg',
    '60+mpg',
  ];

  static List<String> fuelTypeList = FuelType.values.map((e) => e.label).toList();

  static const List<String> colorsList = [
    'Beige',
    'Black',
    'Blue',
    'Bronze',
    'Brown',
    'Gold',
    'Green',
    'Grey',
    'Indigo',
    'Magenta',
    'Maroon',
    'Navy',
    'Orange',
    'Pink',
    'Purple',
    'Red',
    'Silver',
    'White',
    'Yellow',
  ];

  static const List<String> doorList = [
    '2 Doors',
    '3 Doors',
    '4 Doors',
    '5 Doors',
    '6 Doors',
    '7 Doors',
  ];

  static const List<String> driverPositionList = [
    'Left Hand Drive',
    'Right Hand Drive',
  ];

  static const List<String> seatsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
  ];

  static const List<String> bootspaceList = [
    'Upto 3 suitcases (0-300 litres)',
    '3-5 suitcases (301-500 litres)',
    'More than 5suitcases (Over 500 litres)',
  ];

  static const List<String> accelerationList = [
    '0-5s (0-60mph)',
    '5-8s (0-60mph)',
    '8-12s (0-60mph)',
    '12+s (0-60mph)',
  ];

  static const List<String> co2EmissionList = [
    'Upto 75g/km CO2',
    'Upto 100g/km CO2',
    'Upto 110g/km CO2',
    'Upto 120g/km CO2',
    'Upto 130g/km CO2',
    'Upto 140g/km CO2',
    'Upto 150g/km CO2',
    'Upto 165g/km CO2',
    'Upto 175g/km CO2',
    'Upto 185g/km CO2',
    'Upto 200g/km CO2',
    'Upto 225g/km CO2',
    'Upto 250g/km CO2',
    'More than 250g/km CO2',
  ];
}
