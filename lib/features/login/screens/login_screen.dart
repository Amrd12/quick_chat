import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/features/sgin_up/sign_up_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 50.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.logoPng.image(
            width: 200.sp,
            height: 200.sp,
            // fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome Back',
            style: AppTextStyles.alexandria25WhiteBlackW900,
          ),
          SizedBox(height: 50.sp),
          CustomTextFormField(
              prexixIconConstraints: BoxConstraints(maxHeight: 20.sp),
              hintText: 'Enter your email',
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.sp),
                child: const Icon(Icons.email_outlined),
              ),
              label: 'Email'),
          SizedBox(height: 10.sp),
          CustomTextFormField(
              prexixIconConstraints: BoxConstraints(maxHeight: 20.sp),
              hintText: 'Enter your password',
              hintTextStyle: AppTextStyles.alexandria11greyw400,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: const Icon(Icons.key_outlined),
              ),
              label: 'Password'),
          SizedBox(height: 20.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: CustomButton(
              onTap: () {
                context.pushNamed(SignUpScreen.id);
              },
              filled: true,
              boarderRadius: 25.sp,
              title: 'Login',
            ),
          ),
          Spacer(),
          SizedBox(height: 20.sp),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Don't have an account ?  ",
                style: AppTextStyles.alexandria15WhiteBlackW500),
            TextSpan(
              text: "Sign Up",
              style: AppTextStyles.alexandria15WhiteBlackW500.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.whiteBlack,
              ),
            )
          ])),
        ],
      ),
    ));
  }
}