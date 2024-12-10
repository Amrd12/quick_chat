import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.image, required this.title, this.label});
  final String image;
  final String title;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        fit: BoxFit.cover,
        width: 40.sp,
        height: 40.sp,
      ),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label != null ? Text(label!) : Text(''),
          const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }
}
