import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/features/onboarding/widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 125.sp),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/onboarding.png',
                  width: 250.sp,
                  height: 250.sp,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Welcome to Quick Chat',
              style: TextStyle(
                fontFamily: 'mulish',
                color: Color(0xFF0F1828),
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text('Terms and Conditions',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'mulish',
                  color: const Color(0xFF0F1828),
                  fontSize: 15.sp,
                )),
            const SizedBox(height: 25),
            const GetStartedButton(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
