import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/features/profile/screens/profile_screen.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class DarkmodeListTile extends StatefulWidget {
  const DarkmodeListTile({super.key});

  @override
  State<DarkmodeListTile> createState() => _DarkmodeListTileState();
}

class _DarkmodeListTileState extends State<DarkmodeListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('Dark Mode'),
        leading: Image.asset(
          AppColors.isDarkMode
              ? Assets.images.darkModeOnIcon.path
              : Assets.images.darkModeOffIcon.path,
          fit: BoxFit.cover,
          width: 40.sp,
          height: 40.sp,
        ),
        trailing: Switch(
          value: AppColors.isDarkMode, // Replace with your boolean state
          onChanged: (value) {
            setState(() {
              AppColors.isDarkMode = value;
            });
          },
          activeTrackColor: Colors.green, // Active track color
          activeColor: Colors.white, // Active thumb color
          inactiveTrackColor: Colors.grey, // Inactive track color
          inactiveThumbColor: Colors.white, // Inactive thumb color
        ));
  }
}
