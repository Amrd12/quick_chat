import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String get intialRoute {
    return "";
    // if (SharedPref().intialRoute()) {
    //   return BottomNavBar.id;
    // } else {
    //   return LanguageScreen.id;
    // }
  }

  static GoRouter goRouter = GoRouter(initialLocation: intialRoute, routes: [
    GoRoute(path: ""),
  ]);
}
