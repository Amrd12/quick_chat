import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/utils/storage.dart';
import 'package:quick_chat/features/backdoor/Back_door_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//Screens
import 'package:quick_chat/features/Auth/presentation/screens/login_screen.dart';
import 'package:quick_chat/features/onboarding/onboarding_screen.dart';
import 'package:quick_chat/features/profile/screens/profile_screen.dart';
import 'package:quick_chat/features/Auth/presentation/screens/sign_up_screen.dart';
import 'package:quick_chat/features/home/home_screen.dart';
//cubits
import 'package:quick_chat/features/Auth/presentation/cubit/auth_cubit.dart';

abstract class AppRouter {
  static String get intialRoute {
    if (!BackDoorServices.status) {
      return HomeScreen.id;
    }

    if (Storage.instance.isFirstTime) {
      return OnboardingScreen.id;
    }

    if (Storage.instance.isAuth) {
      return HomeScreen.id;
    }
    return LoginScreen.id;
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: intialRoute,
    routes: [
      GoRoute(
        path: OnboardingScreen.id,
        name: OnboardingScreen.id,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: SignUpScreen.id,
        name: SignUpScreen.id,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: LoginScreen.id,
        name: LoginScreen.id,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: HomeScreen.id,
        name: HomeScreen.id,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: ProfileScreen.id,
        name: ProfileScreen.id,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
