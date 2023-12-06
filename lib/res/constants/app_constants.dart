import 'package:csc_picker/csc_picker.dart';

/// `AppConstants` is a singleton class with all static variables.
///
/// It contains all constants that are to be used within the project
///
class AppConstants {
  const AppConstants._();

  static const String appName = 'AutoTitanic';

  static const Duration timeOutDuration = Duration(seconds: 60);

  static const Duration animationDuration = Duration(milliseconds: 300);

  static const Duration fastAnimationDuration = Duration(milliseconds: 200);

  static const double maxMobileWidth = 150;
  static const double maxTabletWidth = 280;
  static const double maxDesktopWidth = 375;

  static const int featuredCarsCount = 7;
  static const int recentCarsCount = 10;
  static const int carouselItemCount = 3;
  static const int carsPerItem = 4;

  static List<CscCountry> allowedCountries = [
    CscCountry.Algeria,
    CscCountry.Angola,
    CscCountry.Benin,
    CscCountry.Botswana,
    CscCountry.Burkina_Faso,
    CscCountry.Burundi,
    CscCountry.Cameroon,
    CscCountry.Central_African_Republic,
    CscCountry.Chad,
    CscCountry.Cote_D_Ivoire_Ivory_Coast,
    CscCountry.Djibouti,
    CscCountry.Congo,
    CscCountry.Egypt,
    CscCountry.Equatorial_Guinea,
    CscCountry.Eritrea,
    CscCountry.Gabon,
    CscCountry.Gambia_The,
    CscCountry.Ghana,
    CscCountry.Guinea,
    CscCountry.Guinea_Bissau,
    CscCountry.Kenya,
    CscCountry.Lesotho,
    CscCountry.Liberia,
    CscCountry.Libya,
    CscCountry.Madagascar,
    CscCountry.Malawi,
    CscCountry.Mali,
    CscCountry.Mauritania,
    CscCountry.Mauritius,
    CscCountry.Morocco,
    CscCountry.Mozambique,
    CscCountry.Namibia,
    CscCountry.Niger,
    CscCountry.Nigeria,
    CscCountry.Rwanda,
    CscCountry.Saint_Pierre_and_Miquelon,
    CscCountry.Senegal,
    CscCountry.Seychelles,
    CscCountry.Sierra_Leone,
    CscCountry.Somalia,
    CscCountry.South_Africa,
    CscCountry.South_Sudan,
    CscCountry.Sudan,
    CscCountry.Tanzania,
    CscCountry.Togo,
    CscCountry.Tunisia,
    CscCountry.Uganda,
    CscCountry.Zambia,
    CscCountry.Zimbabwe,
  ];
}
