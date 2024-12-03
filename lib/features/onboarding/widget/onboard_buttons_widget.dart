import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';

class OnboardButtonsWidget extends StatelessWidget {
  ///displayes the Next pre buttons

  const OnboardButtonsWidget(
      {super.key, required this.page, required this.controller});
  final ValueNotifier<int> page;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppScreenUtils.h * .1,
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtils.isTablet ? 8.sp : 10.sp,
          vertical: AppScreenUtils.isTablet ? 8.sp : 10.sp),
      decoration: BoxDecoration(
        color: ColorName.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.sp),
          topLeft: Radius.circular(20.sp),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    if (value < 2) {
                      return CustomButton(
                        onTap: () => _onPageChange(page.value + 1, context),
                        boarderRadius: 10.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.images.rightArrowDashed
                                .svg(width: 20.sp, height: 20.sp),
                            SizedBox(width: 10.sp),
                            ValueListenableBuilder(
                              valueListenable: page,
                              builder: (context, value, child) {
                                return Text(
                                  "next".tr,
                                  style: AppTextStyles.kWhite18FontW400,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return CustomButton(
                        onTap: () async {
                          await SharedPref().setFirstTime();
                          if (context.mounted) {
                            context.pushReplacementNamed(SignInScreen.id);
                          }
                        },
                        boarderRadius: 10.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.images.rightArrowDashed
                                .svg(width: 20.sp, height: 20.sp),
                            SizedBox(width: 10.sp),
                            ValueListenableBuilder(
                              valueListenable: page,
                              builder: (context, value, child) {
                                return Text(
                                  "sign_in".tr,
                                  style: AppTextStyles.kWhite18FontW400,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    if (value < 2) {
                      return CustomButton(
                          onTap: () => _onPageChange(page.value - 1, context),
                          boarderRadius: 10.sp,
                          color: value == 0
                              ? ColorName.lightGreyDivider
                              : Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.leftArrowDashed
                                  .svg(width: 20.sp, height: 20.sp),
                              SizedBox(width: 10.sp),
                              Text(
                                "back".tr,
                                style: AppTextStyles.kBlack18FontW400,
                              ),
                            ],
                          ));
                    } else {
                      return CustomButton(
                        onTap: () async {
                          await SharedPref().setFirstTime();
                          if (context.mounted) {
                            context.pushReplacementNamed(SignupScreen.id);
                          }
                        },
                        boarderRadius: 10.sp,
                        color: Colors.white,
                        child: Text(
                          textAlign: TextAlign.center,
                          "create_account1".tr,
                          // maxLines: 1,
                          style: AppTextStyles.kBlack18FontW400.copyWith(
                              fontSize: AppScreenUtils.isTablet ? 15.sp : null),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChange(int newPage, BuildContext context) async {
    // if (controller.isAnimating) return; // Prevent animation interruption

    log(page.value.toString());
    if (newPage >= 0 && newPage < 3) {
      page.value = newPage;
      controller.reset(); // Reset the controller before starting the animation
      controller.forward(); // Animate to the next page
    } else if (newPage == 3) {
      await SharedPref().setFirstTime();
      context.pushReplacementNamed(SignInScreen.id);
    } else if (newPage == -1) {}
  }
}
