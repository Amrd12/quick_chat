import 'package:car_wash_mobile_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageIndicator extends StatelessWidget {
  ///displayes the page indecator
  const OnboardingPageIndicator({super.key, required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [0, 1, 2].map((val) {
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 19.06.sp,
            height: 4.77.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              color: val == value ? ColorName.white : pageNumberColor(value),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color pageNumberColor(int value) {
    switch (value) {
      case 0:
        return ColorName.lightgreenishblue;
      case 1:
        return ColorName.blacklight;
      case 2:
        return ColorName.bluelight;
      default:
        return ColorName.lightgreenishblue;
    }
  }
}
