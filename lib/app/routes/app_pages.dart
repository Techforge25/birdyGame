import 'package:bierdygame/app/modules/auth/bindings/auth_bindings.dart';
import 'package:bierdygame/app/modules/auth/view/signInView/sign_in.dart';
import 'package:bierdygame/app/modules/auth/view/signUpView/sign_up.dart';
import 'package:bierdygame/app/modules/clubAdmin/dashboard/view/dashboard_view.dart';
import 'package:bierdygame/app/modules/clubAdmin/games/view/manage_games.dart';
import 'package:bierdygame/app/modules/clubAdmin/newGame/view/new_game_view.dart';
import 'package:bierdygame/app/modules/superAdmin/clubs/view/club_management_sper_admin.dart';
import 'package:bierdygame/app/modules/superAdmin/profile/view/profile_screen.dart';
import 'package:bierdygame/app/modules/superAdmin/reportsAndAnalytics/view/reports_and_analytics.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/bindings/super_admin_bottom_nav_binding.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/view/super_admin_bottom_nav.dart';
import 'package:bierdygame/app/modules/superAdmin/dashboard/bindings/super_admin_bindings.dart';
import 'package:bierdygame/app/modules/superAdmin/dashboard/view/super_admin.dart';
import 'package:bierdygame/app/modules/onBoading/on_boarding_welcome.dart';
import 'package:bierdygame/app/modules/splashScreen/splash_view.dart';
import 'package:bierdygame/app/modules/welcome/welcome_screen.dart';
import 'package:bierdygame/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.welcome, page: () => WelcomeView()),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpView(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInView(),
      binding: AuthBindings(),
    ),
    GetPage(name: Routes.ON_BOARDING_WELCOME, page: () => OnboardingScreen()),
    GetPage(
      name: Routes.SUPER_ADMIN,
      page: () => SuperAdminDashboard(),
      binding: SuperAdminBindings(),
    ),
    GetPage(
      name: Routes.SUPER_ADMIN_BOTTOM_NAV,
      page: () => SuperAdminBottomNav(),
      binding: SuperAdminBottomNavBinding(),
    ),
    GetPage(
      name: Routes.REPORTS_AND_ANALYTICS_SUPER_ADMIN,
      page: () => ReportsAndAnalytics(),
    ),
    GetPage(name: Routes.SUPER_ADMIN_PROFILE, page: () => ProfileScreen()),
    GetPage(name: Routes.WELCOME_VIEW, page: () => WelcomeView()),


    GetPage(
      name: Routes.CLUB_MANAGEMENT,
      page: () => SuperAdminClubManagement(),
    ),
    // Club Admins
    GetPage(name: Routes.CLUB_ADMIN, page: ()=>ClubAdminDashboard()),
    GetPage(name: Routes.CREATE_GAME, page: () => NewGameView(),),
    GetPage(name: Routes.MANAGE_GAMES, page: () => ManageClubsGames()),
  ];
}
