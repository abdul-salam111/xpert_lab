import 'package:get/get.dart';

import '../modules/index.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () =>  ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ALERTS,
      page: () => const AlertsView(),
      binding: AlertsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.PERSONALINFO,
          page: () => const PersonalinfoView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SEARCH_TESTS,
      page: () => SearchTestsView(),
      binding: SearchTestsBinding(),
    ),
    GetPage(
      name: _Paths.TEST_DETAILS,
      page: () => const TestDetailsView(),
      binding: TestDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TESTCATEGORIES,
      page: () => TestcategoriesView(),
      binding: TestcategoriesBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () => const CartScreenView(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS_AND_DEALS,
      page: () => const OffersAndDealsView(),
      binding: OffersAndDealsBinding(),
    ),
   
  ];
}
