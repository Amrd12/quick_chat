import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/gen/assets.gen.dart';
import 'package:quick_chat/gen/colors.gen.dart';
import 'package:quick_chat/gen/fonts.gen.dart';

class AppTextStyles {
  static TextStyle alexandria25WhitekW900 = TextStyle(
    fontSize: 25.sp,
    color: Colors.white,
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w900,
  );

  static TextStyle alexandria25WhiteBlackW900 = TextStyle(
    fontSize: 25.sp,
    color: AppColors.whiteBlack,
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w900,
  );

  static TextStyle alexandria25BlackWhiteW900 = TextStyle(
    fontSize: 25.sp,
    color: AppColors.blackWhite,
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w900,
  );
  static TextStyle alexandria25GreyW900 = TextStyle(
    fontSize: 25.sp,
    color: AppColors.grey,
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w900,
  );
  static TextStyle alexandria25Greyo10W900 = TextStyle(
    fontSize: 25.sp,
    color: AppColors.grey.withOpacity(.1),
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w900,
  );

  static TextStyle alexandria15WhiteBlackW500 = TextStyle(
    fontSize: 15.sp,
    color: AppColors.whiteBlack,
    fontFamily: FontFamily.alexandria,
    fontWeight: FontWeight.w500,
  );

  static TextStyle poppins24WhiteBlackW900 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColors.whiteBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle poppins24WBlackhiteW900 = TextStyle(
    fontFamily: FontFamily.poppins,
    color: AppColors.whiteBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle alexandria11redw400 = TextStyle(
    fontFamily: FontFamily.alexandria,
    color: AppColors.red,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle alexandria20WhiteBlackW700 = TextStyle(
    fontFamily: FontFamily.alexandria,
    color: AppColors.whiteBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
}
