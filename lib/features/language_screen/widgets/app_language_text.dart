import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/gen/colors.gen.dart';
import 'package:quick_chat/gen/fonts.gen.dart';

class AppLanguageText extends StatelessWidget {
  const AppLanguageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Adds vertical padding to the widget. The height is calculated as 2% of the screen height.
      padding: EdgeInsets.symmetric(vertical: AppScreenUtils.h * 0.02),

      // Using Text.rich to display rich text (text with different styles in the same string).
      child: Text.rich(
        TextSpan(
          // Check if the app's current locale is English using Get.locale!
          // Based on the language, it shows the word 'App' and 'Language' in different orders.
          // The text is translated using the .tr method from GetX.
          children: Get.locale!.languageCode == 'en'
              // If the locale is 'en' (English), show 'App' first, then 'Language'.
              ? [
                  TextSpan(
                    text:
                        'app'.tr, // 'App' is displayed, translated using GetX.
                    style: TextStyle(
                      // Styling for the word 'App': bold, black, Almarai font, size 25.
                      fontSize: 25.sp,
                      color: ColorName.blackColor,
                      fontFamily: FontFamily.alexandria,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // After 'App', 'Language' is displayed.
                  TextSpan(
                    text: 'language'.tr, // 'Language' is translated using GetX.
                    style: TextStyle(
                      // Styling for 'Language': bold, green, Almarai font, size 25.
                      color: ColorName.green,
                      fontSize: 25.sp,
                      fontFamily: FontFamily.almarai,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              // If the locale is not 'en' (likely Arabic), show 'Language' first, then 'App'.
              : [
                  TextSpan(
                    text: 'language'.tr, // 'Language' is shown first.
                    style: TextStyle(
                      // Same styling as before: green, bold, Almarai font, size 25.
                      color: ColorName.green,
                      fontSize: 25.sp,
                      fontFamily: FontFamily.almarai,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // After 'Language', 'App' is displayed in Arabic.
                  TextSpan(
                    text: 'app'.tr, // 'App' is translated and displayed.
                    style: TextStyle(
                      // Same styling as before: black, bold, Almarai font, size 25.
                      fontSize: 25.sp,
                      color: ColorName.blackColor,
                      fontFamily: FontFamily.almarai,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
