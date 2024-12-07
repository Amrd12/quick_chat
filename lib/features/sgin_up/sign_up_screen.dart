import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/core/widgets/custom_image_picker.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String id = "/SginUpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: SafeArea(
          child: SizedBox(
        width: AppScreenUtils.w,
        height: AppScreenUtils.h,
        child: const SignUpBody(),
      )),
    );
  }
}

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImagePicker(
            ontap: (XFile file) {},
            boxDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
            addIcon: CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.textColor,
              child: Icon(
                Icons.add,
                color: AppColors.background,
                size: 20.sp,
              ),
            ),
            child: Assets.images.profileImagePlaceholder.svg(),
          ),
          CustomTextFormField(
            hintText: "User Name",
            prefixIcon: Icon(Icons.abc),
            label: "User Name",
          ),
        ],
      ),
    );
  }
}
