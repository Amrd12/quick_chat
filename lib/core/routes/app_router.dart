import 'package:go_router/go_router.dart';
import 'package:quick_chat/features/onboarding/onboarding_screen.dart';

abstract class AppRouter {
  static String get intialRoute {
    return "";
    // if (SharedPref().intialRoute()) {
    //   return BottomNavBar.id;
    // } else {
    //   return LanguageScreen.id;
    // }
  }

  static GoRouter goRouter =
      GoRouter(initialLocation: OnboardingScreen.id, routes: [
    GoRoute(
      path: OnboardingScreen.id,
      name: OnboardingScreen.id,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ]);
}
