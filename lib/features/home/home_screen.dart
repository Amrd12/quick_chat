import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/core/widgets/custom_appbar.dart';
import 'package:quick_chat/core/widgets/custom_button.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
      child: Scaffold(
        appBar: CustomAppBars(
          text: "Chats",
          actions: <Widget>[
            IconButton(
                icon: Assets.images.icons.cameraIcon.svg(),
                onPressed: () => null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.3),
                )),
            IconButton(
              icon: Assets.images.icons.editIcon.svg(),
              onPressed: () => null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(.3),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0.sp),
          child: Column(
            children: [
              // SizedBox(height: 20.h),
              CustomTextFormField(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  label: "Search"),
              SizedBox(height: 12.h),
              const StatusListViewWidget(),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        foregroundImage: Assets
                            .images.pexelsRioKuncoro13738342773977
                            .provider(),
                        radius: 40.r,
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Martin Randolph",
                            style: AppTextStyles.alexandria20WhiteBlackW700,
                          ),
                          Text(
                            "You: What’s man! · 9:40 AM",
                            style: AppTextStyles.alexandria14greykW500,
                          ),
                        ],
                      )),
                      SizedBox(width: 15.w),
                      CustomButton(
                          onTap: () => null,
                          color: Colors.transparent,
                          child: const Icon(Icons.circle_outlined))
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusListViewWidget extends StatelessWidget {
  const StatusListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          itemCount: 11,
          itemBuilder: (context, index) => index == 0
              ? CustomButton(
                  onTap: () => null,
                  isCircle: true,
                  width: 80.w,
                  // boarderRadius: 40.r,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.3),

                  child: Icon(
                    Icons.add,
                    size: 40.r,
                  ),
                )
              : CustomButton(
                  onTap: () => null,
                  isCircle: true,
                  width: 80.w,
                  // boarderRadius: 40.r,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.3),
                  image:
                      Assets.images.pexelsRioKuncoro13738342773977.provider(),
                )),
    );
  }
}
