import 'package:auto_titanic/controllers/controllers.dart';
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
  static const transitionDuration = Duration(milliseconds: 2000);

  static const transition = Transition.noTransition;

  static const initial = AppRoutes.home;

  static final pages = [
    GetPage<SplashView>(
      name: AppRoutes.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: transition,
    ),
    GetPage<HomeView>(
      name: AppRoutes.home,
      transitionDuration: transitionDuration,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: transition,
    ),
    GetPage<AuthView>(
      name: AppRoutes.auth,
      transitionDuration: transitionDuration,
      page: AuthView.new,
      binding: AuthBinding(),
      transition: transition,
    ),
    GetPage<AboutUsView>(
      name: AppRoutes.aboutUs,
      transitionDuration: transitionDuration,
      page: AboutUsView.new,
      transition: transition,
    ),
    GetPage<ContactUsView>(
      name: AppRoutes.contactUs,
      transitionDuration: transitionDuration,
      page: ContactUsView.new,
      transition: transition,
    ),
    GetPage<PrivacyView>(
      name: AppRoutes.privacyPolicy,
      transitionDuration: transitionDuration,
      page: PrivacyView.new,
      transition: transition,
    ),
    GetPage<WelcomeView>(
      name: AppRoutes.welcome,
      transitionDuration: transitionDuration,
      page: WelcomeView.new,
      transition: transition,
    ),
    GetPage<TermsConditionsView>(
      name: AppRoutes.termsCondition,
      transitionDuration: transitionDuration,
      page: TermsConditionsView.new,
      transition: transition,
    ),
    GetPage<PostingAdView>(
      name: AppRoutes.postingAd,
      transitionDuration: transitionDuration,
      page: PostingAdView.new,
      transition: transition,
    ),
    GetPage<BuyNewVehicleView>(
      name: AppRoutes.buyingNewVehicle,
      transitionDuration: transitionDuration,
      page: BuyNewVehicleView.new,
      transition: transition,
    ),
    GetPage<BuyUsedVehicleView>(
      name: AppRoutes.buyingUsedVehicle,
      transitionDuration: transitionDuration,
      page: BuyUsedVehicleView.new,
      transition: transition,
    ),
    GetPage<SafetyNoticeView>(
      name: AppRoutes.safetyNotice,
      transitionDuration: transitionDuration,
      page: SafetyNoticeView.new,
      transition: transition,
    ),
    GetPage<SecurityCentreView>(
      name: AppRoutes.secuirityCentre,
      transitionDuration: transitionDuration,
      page: SecurityCentreView.new,
      transition: transition,
    ),
  ];
}
