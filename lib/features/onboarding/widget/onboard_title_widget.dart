import 'package:car_wash_mobile_app/core/constants/app_text_styles.dart';
import 'package:car_wash_mobile_app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardTitleWidget extends StatelessWidget {
  ///displays Title and subtitle
  const OnboardTitleWidget({super.key, required this.page});
  final ValueNotifier<int> page;

  @override
  Widget build(BuildContext context) {
    List<String> titleText = [
      "Onboard_titel_1".tr,
      "Onboard_titel_2".tr,
      "Onboard_titel_3".tr,
    ];
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (BuildContext context, int value, Widget? child) {
            return Text.rich(
              TextSpan(
                children: titleText[value].split(' ').map((word) {
                  // Example logic to style specific words
                  if (("your_location".tr).contains(word)) {
                    return TextSpan(
                        text: '$word ', // Word followed by space
                        style: AppTextStyles.kGreen20FontW700);
                  } else if (("wash".tr).contains(word)) {
                    return TextSpan(
                        text: '$word ', // Word followed by space
                        style: AppTextStyles.kBlue20FontW700);
                  } else {
                    return TextSpan(
                      text: '$word ', // Word followed by space
                      style: AppTextStyles.kBlack20FontW700,
                    );
                  }
                }).toList(),
              ),
            );
          },
        ),
        SizedBox(
          height: AppScreenUtils.isTablet ? 5.sp : 20.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtils.isTablet ? 15.sp : 30.sp),
          child: Text(
            "Onboard_suptitel_1".tr,
            style: AppTextStyles.kBlack18FontW400
                .copyWith(fontSize: AppScreenUtils.isTablet ? 14.sp : null),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
