import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/core/utils/app_snack_bar.dart';
import 'package:quick_chat/core/utils/validator_utils.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/features/home/home_screen.dart';
import 'package:quick_chat/features/login/widgets/email_text_form_field.dart';
import 'package:quick_chat/features/sgin_up/sign_up_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/loginScreen';
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              EmailTextFormField(),
              SizedBox(height: 10.sp),
              CustomTextFormField(
                  suffixIconConstraints:
                      BoxConstraints(minWidth: 50, minHeight: 50),
                  hintText: 'Enter your password',
                  obscureText: T,
                  prefixIcon: Assets.images.icons.lockIcon
                      .image(color: AppColors.whiteBlack),
                  label: 'Password'),
              SizedBox(height: 20.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: CustomButton(
                  onTap: () {
                    AppSnackBar.showSnackBar(context, "Logged");
                    context.pushNamed(HomeScreen.id);
                  },
                  filled: true,
                  boarderRadius: 25.sp,
                  title: 'Login',
                ),
              ),
              const Spacer(),
              SizedBox(height: 20.sp),
              GestureDetector(
                onTap: () {
                  
                  context.push(SignUpScreen.id);
                },
                child: Text.rich(TextSpan(children: [
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
              ),
            ],
          ),
        ));
  }
}
