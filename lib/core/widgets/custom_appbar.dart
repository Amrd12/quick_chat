import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/routes/app_router.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/features/profile/screens/profile_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class CustomAppBars extends AppBar {
  final String text;
  final List<Widget>? actions;

  CustomAppBars({super.key, required this.text, required this.actions})
      : super(
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(ProfileScreen.id);
              },
              child: SizedBox(
                height: 40.sp,
                width: 40.sp,
                child: ClipOval(
                  child: Assets.images.pexelsRioKuncoro13738342773977
                      .image(fit: BoxFit.cover),
                ),
              ),
            );
          }),

          // backgroundColor: AppColors.blackWhite,
          title: Text(
            text,
            style: AppTextStyles.alexandria25WhiteBlackW900,
          ),
          elevation: 0.0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          actions: actions,
        );
}
