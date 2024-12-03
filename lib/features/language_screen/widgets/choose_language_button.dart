import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/features/onboarding/screen/onboarding_screen.dart';

//Edit By : Amr Elnbawy
//Edit Date : 22/10/2024
//Edit Note : Replaced pushNamed with pushReplacementNamed
// Define a stateless widget 'ChooseLanguageButton'.
class ChooseLanguageButton extends StatelessWidget {
  const ChooseLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a Row widget that contains two buttons for language selection (EN and Arabic).
    return Row(
      // Centers the buttons horizontally.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CustomButton widget for the English language selection.
        CustomButton(
          // onTap function is executed when the button is tapped.
          // It updates the locale to English and navigates to the OnboardingScreen.
          onTap: () async {
            await Get.updateLocale(const Locale('en')).then((_) {
              // After updating the locale, check if the context is still active (mounted),
              // and if true, navigate to the OnboardingScreen using GoRouter.
              if (context.mounted) {
                context.pushReplacementNamed(OnboardingScreen.id);
              }
            });
          },
          // Specifies the button width based on the screen size.
          width: AppScreenUtils.w * 0.4,
          // Light green background color for the button.
          color: ColorName.lightgreen,
          // Button height based on screen size.
          height: AppScreenUtils.h * 0.07,
          // Border radius to make the corners rounded (10 pixels).
          boarderRadius: 10,
          // The child widget defines the content inside the button (in this case, a text widget).
          child: Text(
            'EN', // Button text: 'EN' for English.
            style: TextStyle(
              // Black color for the text.
              color: ColorName.blackColor,
              // Font size for the button text.
              fontSize: 18.sp,
              // Font family used for the text styling (Almarai font).
              fontFamily: FontFamily.almarai,
            ),
          ),
        ),
        // Adds horizontal space between the two buttons (10 pixels).
        const SizedBox(width: 10),
        // CustomButton widget for the Arabic language selection.
        CustomButton(
          // onTap function for the Arabic button. It changes the locale to Arabic.
          onTap: () {
            /*
             Created By : Abdullah Ghaith
             Edited By : Abdullah Ghaith
             Edit Date : 14/10/2024
             Edit Note : On Clicked, it will change the language to Arabic
             */
            Get.updateLocale(const Locale('ar')).then((_) {
              // After updating the locale, navigate to the OnboardingScreen.
              if (context.mounted) {
                context.pushReplacementNamed(OnboardingScreen.id);
              }
            });
          },
          // Specifies the border radius (rounded corners) of the button (10 pixels).
          boarderRadius: 10,
          // Button width and height based on the screen size.
          width: AppScreenUtils.w * 0.4,
          height: AppScreenUtils.h * 0.07,
          // Green background color for the button.
          color: ColorName.green,
          // The child widget contains the text displayed on the button.
          child: Text(
            'عربي', // Arabic text for the button.
            style: TextStyle(
              // White color for the text.
              color: ColorName.white,
              // Font size for the button text.
              fontSize: 15.sp,
              // Font family used for the text (Almarai font).
              fontFamily: FontFamily.almarai,
            ),
          ),
        ),
      ],
    );
  }
}
