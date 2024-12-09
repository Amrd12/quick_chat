import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/core/widgets/custom_appbar.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: Scaffold(
        appBar: CustomAppBars(
          text: "Chats",
          actions: <Widget>[
            IconButton(
                icon: Assets.images.icons.cameraIcon.svg(),
                onPressed: () => null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteBlack.withOpacity(.1))),
            IconButton(
              icon: Assets.images.icons.editIcon.svg(),
              onPressed: () => null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteBlack.withOpacity(.1)),
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
