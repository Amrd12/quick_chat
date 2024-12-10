import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/features/login/screens/login_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.sp),
              child: Align(
                alignment: Alignment.center,
                child: Assets.images.onboarding.image(
                  width: 250.sp,
                  height: 250.sp,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Welcome to Quick Chat',
              style: AppTextStyles.poppins24WBlackhiteW900,
            ),
            const Spacer(),
            const Text(
              'Terms and Conditions',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: CustomButton(
                onTap: () {
                  context.pushReplacementNamed(LoginScreen.id);
                },
                filled: true,
                boarderRadius: 25.sp,
                title: 'Get Started',
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
