import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/constants/app_text_styles.dart';
import 'package:quick_chat/gen/colors.gen.dart';

/*
edited by : Mohamed Waleed
edited at : 14/10/2024
edits :
- add property titleTextStyle and it will be nullable if the user didn't specify it then use the defualt text style

 */

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.title,
    this.color = ColorName.green,
    this.width,
    this.height,
    this.image,
    this.filled = true,
    this.isCircle = false,
    this.boarderRadius,
    this.child,
    this.radius,
    this.titleTextStyle,
  });
  final void Function()? onTap;
  final String? title;
  final Color color;
  final String? image;
  final double? width;
  final double? height;
  final double? radius;
  final double? boarderRadius;
  final bool filled;
  final bool isCircle;
  final Widget? child;
  final TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: filled ? color : Colors.white,
          borderRadius: BorderRadius.circular(boarderRadius ?? 0),
          border: filled ? null : Border.all(color: ColorName.green),
          image: image == null
              ? null
              : DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
        ),
        height: radius ?? height,
        width: radius ?? width,
        child: child ??
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              child: Text(
                title ?? "",
                style: titleTextStyle ??
                    (filled
                        ? AppTextStyles.alexandria25whitew900
                        : AppTextStyles.alexandria25blackw900),
              ),
            ),
      ),
    );
  }
}
