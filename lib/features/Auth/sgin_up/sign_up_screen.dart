import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_snack_bar.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/core/widgets/custom_image_picker.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/features/home/home_screen.dart';
import 'package:quick_chat/features/Auth/login/screens/login_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';
import 'package:quick_chat/core/utils/validator_utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String id = "/SginUpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
          // SizedBox(height: 50.h),
          const Spacer(),
          CustomImagePicker(
            ontap: (XFile file) {},
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              // color: AppColors.grey.withOpacity(.2),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            addIcon: CircleAvatar(
              radius: 16.r,
              // backgroundColor: AppColors.whiteBlack,
              child: Icon(
                Icons.add,
                // color: AppColors.blackWhite,
                size: 20.sp,
              ),
            ),
            child: Assets.images.profileImagePlaceholder.svg(),
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            hintText: "User Name",
            prefixIcon: Assets.images.icons.personIcon
                .image(color: AppColors.whiteBlack),
            label: "User Name",
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            validator: (p0) => Validators.emailValidator(p0),
            hintText: "Email",
            label: "Email",
            prefixIcon: Assets.images.icons.emailIcon
                .image(color: AppColors.whiteBlack),
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            hintText: "Password",
            prefixIcon:
                Assets.images.icons.lockIcon.image(color: AppColors.whiteBlack),
            label: "Password",
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            hintText: "Confirm Password",
            prefixIcon:
                Assets.images.icons.lockIcon.image(color: AppColors.whiteBlack),
            label: "Confirm Password",
          ),
          const Spacer(flex: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: CustomButton(
              onTap: () => onTap(),
              filled: true,
              boarderRadius: 25.sp,
              title: 'Create Account',
            ),
          ),
          SizedBox(height: 15.sp),
          GestureDetector(
            onTap: () => context.pushNamed(LoginScreen.id),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Already have an account ?  ",
                  style: AppTextStyles.alexandria15WhiteBlackW500),
              TextSpan(
                text: "login",
                style: AppTextStyles.alexandria15WhiteBlackW500.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.whiteBlack,
                ),
              )
            ])),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  void onTap() {
    AppSnackBar.showSnackBar(context, "Created");
    context.pushNamed(HomeScreen.id);
  }
}
