import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/home/view/home_view.dart';
import '../modules/splash/splash_view.dart';

class AppRoute {

  static const String splashscreen = "/splash_screen";
  static const String homeScreen = "/home_screen";

  static List<GetPage> route = [
    GetPage(name: homeScreen, page: () => const HomeView()),
    GetPage(name: splashscreen, page: () => const SplashView()),
  ];
}
