import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static const transition = Transition.noTransition;

  static const initial = AppRoutes.home;

  static GetPage _sellView() => GetPage<SellVehicleView>(
        name: AppRoutes.sell,
        page: SellVehicleView.new,
        binding: HomeBinding(),
        transition: transition,
      );

  static final pages = [
    GetPage<SplashView>(
      name: AppRoutes.splash,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.home,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<LoginView>(
      name: AppRoutes.login,
      page: LoginView.new,
      binding: AuthBinding(),
      transition: transition,
    ),
    GetPage<RegisterView>(
      name: AppRoutes.register,
      page: RegisterView.new,
      binding: AuthBinding(),
      transition: transition,
    ),
    GetPage<AboutUsView>(
      name: AppRoutes.aboutUs,
      page: AboutUsView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<ContactUsView>(
      name: AppRoutes.contactUs,
      page: ContactUsView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<PrivacyView>(
      name: AppRoutes.privacyPolicy,
      page: PrivacyView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<WelcomeView>(
      name: AppRoutes.welcome,
      page: WelcomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<TermsConditionsView>(
      name: AppRoutes.termsCondition,
      page: TermsConditionsView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<PostingAdView>(
      name: AppRoutes.postingAd,
      page: PostingAdView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<BuyNewVehicleView>(
      name: AppRoutes.buyingNewVehicle,
      page: BuyNewVehicleView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<BuyUsedVehicleView>(
      name: AppRoutes.buyingUsedVehicle,
      page: BuyUsedVehicleView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<SafetyNoticeView>(
      name: AppRoutes.safetyNotice,
      page: SafetyNoticeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<SecurityCentreView>(
      name: AppRoutes.securityCentre,
      page: SecurityCentreView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    // ---- HomeView for different vehicles ----
    GetPage<HomeView>(
      name: AppRoutes.cars,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
      middlewares: [SellMiddleware()],
      children: [_sellView()],
    ),
    GetPage<HomeView>(
      name: AppRoutes.vans,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.bikes,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.motorAndCaravans,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.trucks,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.farms,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.farms,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.plants,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.parts,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.carRentals,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    // ---- End HomeView for different vehicles ----
    GetPage<InventoryView>(
      name: AppRoutes.search,
      page: InventoryView.new,
      binding: InventoryBinding(),
      transition: transition,
    ),
    GetPage<AdvanceSearchView>(
      name: AppRoutes.advanceSearch,
      page: AdvanceSearchView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
  ];
}
