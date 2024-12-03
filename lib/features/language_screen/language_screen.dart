import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/features/language_screen/widgets/app_language_text.dart';
import 'package:quick_chat/features/language_screen/widgets/choose_language_button.dart';

class LanguageScreen extends StatefulWidget {
  static const String id = '/languageScreen';
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: AppScreenUtils.w,
                height: AppScreenUtils.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.languageViewBackground.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppScreenUtils.h * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 179.sp,
                      width: 216.sp,
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Image.asset(
                        Assets.images.logo.path,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const AppLanguageText(),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.sp),
                        child: Text(
                          'choose_language'.tr,
                          style: TextStyle(fontSize: 12.sp),
                        )),
                    SizedBox(
                      height: 18.sp,
                    ),

                    ///Edited by amr elnbawy
                    ///date 21 /10
                    ///made the widget dirction static
                    const Directionality(
                        textDirection: TextDirection.ltr,
                        child: ChooseLanguageButton()),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
