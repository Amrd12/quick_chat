import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/features/profile/widgets/custom_list_tile.dart';
import 'package:quick_chat/features/profile/widgets/dark_mode_list_tile.dart';
import 'package:quick_chat/features/profile/widgets/profile_frame.dart';
import 'package:quick_chat/features/profile/widgets/profile_picture.dart';
import 'package:quick_chat/features/profile/widgets/user_name_list_tile.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  static const id = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: SizedBox(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  const Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ProfilePicture(),
                        ProfileFrame(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.sp),
                    child: Center(
                      child: Text(
                        'Abdullah Ghaith',
                        style: AppTextStyles.alexandria20WhitekW100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.sp),
          const DarkmodeListTile(),
          SizedBox(height: 5.sp),
          CustomListTile(
            image: Assets.images.activeStatus.path,
            title: 'Active Status',
            label: 'ON',
          ),
          SizedBox(height: 5.sp),
          CustomListTile(
            image: Assets.images.userName.path,
            title: 'Username',
            label: 'user.name',
          ),
          SizedBox(height: 5.sp),
          CustomListTile(
            image: Assets.images.notification.path,
            title: 'Notifications & Sounds',
          ),
          SizedBox(height: 5.sp),
          CustomListTile(
            image: Assets.images.people.path,
            title: 'People',
          ),
          SizedBox(height: 5.sp),
          CustomListTile(
            image: Assets.images.people.path,
            title: 'Phone Contacts',
          ),
        ],
      ),
    ));
  }
}
