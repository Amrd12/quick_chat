import 'package:car_wash_mobile_app/core/constants/app_text_styles.dart';
import 'package:car_wash_mobile_app/core/utils/app_utils.dart';
import 'package:car_wash_mobile_app/features/onboarding/widget/onboarding_page_indicator.dart';
import 'package:car_wash_mobile_app/gen/assets.gen.dart';
import 'package:car_wash_mobile_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'onboard_car_widget.dart';

class OnboardPageWidget extends StatelessWidget {
  ///displays the stack (colored container , car images , page Number , page Indecator)
  const OnboardPageWidget(
      {super.key, required this.page, required this.controller});
  final ValueNotifier<int> page;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    List<Color> containerColor = const [
      ColorName.mintGreen,
      Colors.black,
      ColorName.blue,
    ];

    late double w75 = AppScreenUtils.w * 0.75;
    late double halfDiff = (AppScreenUtils.w - w75) / 2;

    late List<double> aliment = [
      0,
      halfDiff,
      AppScreenUtils.w - w75,
    ];
    return ValueListenableBuilder(
        valueListenable: page,
        builder: (context, value, child) {
          return Stack(
            // alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                width: w75,
                height: AppScreenUtils.h * (AppScreenUtils.isTablet ? .63 : .5),
                left: aliment[value],
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  color: containerColor[value],
                  duration: const Duration(seconds: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10.sp),
                      AnimatedContainer(
                        // alignment: const Alignment(0, -.8),
                        duration: const Duration(milliseconds: 300),
                        child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: (value + 1).toString(),
                              style: AppTextStyles.kWhite40AntonFontW400,
                            ),
                            TextSpan(
                              text: "/3",
                              style: pageTextStyle(value),
                            )
                          ],
                        )),
                      ),
                      const Spacer(),
                      OnboardingPageIndicator(
                        value: value,
                      ),
                      SizedBox(height: 10.sp),
                    ],
                  ),
                ),
              ),
              carImage(value)
                  .animate(controller: controller)
                  .fadeIn(delay: const Duration(milliseconds: 200)),
            ],
          );
        });
  }
}

Widget carImage(int value) {
  switch (value) {
    case 0:
      return _GreenCarWidget();
    case 1:
      return _BlackCarWidget();
    case 2:
      return _BlueCarWidget();
    default:
      return _BlueCarWidget(); // Default case
  }
}

TextStyle pageTextStyle(int value) {
  switch (value) {
    case 0:
      return AppTextStyles.kGreenBlue40AntonFontW400;
    case 1:
      return AppTextStyles.kBlackLight40AntonFontW400;
    case 2:
      return AppTextStyles.kWhite40AntonFontW400;
    default:
      return AppTextStyles.kBlack40AntonFontW400;
  }
}
