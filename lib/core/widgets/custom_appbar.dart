import 'package:flutter/material.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_utils.dart';
import 'package:quick_chat/features/profile/screens/profile_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';
import "package:go_router/go_router.dart";
// class CustomAppBars extends AppBar {
//   final String text;
//   final List<Widget>? actions;

//   CustomAppBars({super.key, required this.text, required this.actions})
//       : super(
//           leading: SizedBox(
//             height: 40.sp,
//             width: 40.sp,
//             child: ClipOval(
//               child: Assets.images.pexelsRioKuncoro13738342773977
//                   .image(fit: BoxFit.cover),
//             ),
//           ),

//           // backgroundColor: AppColors.blackWhite,
//           title: Text(
//             text,
//             style: AppTextStyles.alexandria25WhiteBlackW900,
//           ),
//           elevation: 0.0,
//           scrolledUnderElevation: 0,
//           automaticallyImplyLeading: false,
//           actions: actions,
//         );
// }
class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBars({
    super.key,
    required this.text,
    this.actions,
    this.backbutton = false,
  });
  final bool backbutton;
  final String text;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.h,
          bottom: 15.h,
          left: 5.w,
          right: 5.w,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (backbutton)
              Padding(
                padding: EdgeInsetsDirectional.only(end: 1.w),
                child: IconButton(
                  onPressed: () {
                    //check first if the context can pop or not
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                ),
              ),
            GestureDetector(
              onTap: () => context.push(ProfileScreen.id),
              child: SizedBox(
                height: 40.sp,
                width: 40.sp,
                child: ClipOval(
                  child: Assets.images.pexelsRioKuncoro13738342773977
                      .image(fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: AppTextStyles.alexandria25WhiteBlackW900,
            ),
            Spacer(),
            if (actions != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppScreenUtils.w, 80);
}
