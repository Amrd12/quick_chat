import 'package:go_router/go_router.dart';

//Screens
import 'package:quick_chat/features/onboarding/onboarding_screen.dart';
import 'package:quick_chat/features/sgin_up/sign_up_screen.dart';

abstract class AppRouter {
  static String get intialRoute {
    return "";

    // if (SharedPref().intialRoute()) {
    //   return BottomNavBar.id;
    // } else {
    //   return LanguageScreen.id;
    // }
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: OnboardingScreen.id,
    routes: [
      GoRoute(
        path: OnboardingScreen.id,
        name: OnboardingScreen.id,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: SignUpScreen.id,
        name: SignUpScreen.id,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
