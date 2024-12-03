import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/features/onboarding/widget/onboard_buttons_widget.dart';
import 'package:quick_chat/features/onboarding/widget/onboard_page_widget.dart';
import 'package:quick_chat/features/onboarding/widget/onboard_title_widget.dart';

/// OnboardingScreen is the main widget for the onboarding flow of the app.
///
/// It manages the different screens in the onboarding process, displaying
/// titles, images, and control buttons. The class is structured as a StatefulWidget
/// because it needs to manage page transitions and animations.
///
/// Static constant:
/// - [id]: The route ID for this screen, used for navigation.
///
///
///  Created By : Amr Elnabawy
///  Edited By : Amr Elnabawy
///  Edit Date : 16/10/2024
///  Modified
///
///
/// It uses:
/// - [OnboardTitleWidget] to display the page title.
/// - [OnboardPageWidget] to display the onboarding content (images and page indicator).
/// - [OnboardButtonsWidget] to display the navigation buttons (Next and Previous).
class OnboardingScreen extends StatefulWidget {
  static const String id = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<int> page;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    page = ValueNotifier<int>(0);

    // Initialize the AnimationController with a duration and vsync.
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250), // Animation duration
    );
  }

  @override
  void dispose() {
    page.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: AppScreenUtils.h * .02,
            ),
            OnboardTitleWidget(page: page), //displays Title and subtitle
            SizedBox(height: AppScreenUtils.isTablet ? .5.sp : 12.sp),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  onPageSwipe(page.value + 1); // Swipe right
                } else if (details.primaryVelocity! > 0) {
                  onPageSwipe(page.value - 1); // Swipe left
                }
              },
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  width: AppScreenUtils.w,
                  height:
                      AppScreenUtils.h * (AppScreenUtils.isTablet ? .63 : .5),
                  child: OnboardPageWidget(
                      controller: controller,
                      page:
                          page), //displays the stack (colored container , car images , page Number , page Indecator)
                ),
              ),
            ),
            SizedBox(height: AppScreenUtils.isTablet ? 1.sp : 40.sp),
            OnboardButtonsWidget(
              page: page,
              controller: controller,
            ) // displayes the Next pre buttons
          ],
        ),
      ),
    );
  }

  void onPageSwipe(int newPage) {
    // if (controller.isAnimating) return; // Prevent animation interruption

    log(page.value.toString());
    if (newPage >= 0 && newPage < 3) {
      page.value = newPage;
      controller.reset(); // Reset the controller before starting the animation
      controller.forward(); // Animate to the next page
    }
  }
}
