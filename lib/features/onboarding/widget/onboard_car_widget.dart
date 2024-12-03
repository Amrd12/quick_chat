part of 'onboard_page_widget.dart';

class _GreenCarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppScreenUtils.isTablet ? 100.sp : 10.sp,
          left: AppScreenUtils.isTablet ? 150.sp : 35.sp,
          child: Transform.scale(
              scale: AppScreenUtils.isTablet ? 2 : 1,
              child: Assets.images.greenCar.image()),
        ),
      ],
    );
  }
}

class _BlackCarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppScreenUtils.isTablet
              ? 150.sp
              : 100.sp, // Match green car's top positioning
          left: AppScreenUtils.isTablet
              ? 100.sp
              : 20.sp, // Match green car's left positioning
          child: Transform.scale(
              scale: AppScreenUtils.isTablet ? 2.2 : 1,
              child: Assets.images.blackCar.image()), // Scale for consistency
        ),
      ],
    );
  }
}

class _BlueCarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppScreenUtils.isTablet
              ? 70.sp
              : -75.sp, // Match green car's top positioning
          left: AppScreenUtils.isTablet
              ? 70.sp
              : 0.sp, // Adjust for proper alignment
          child: Transform.scale(
              scale: AppScreenUtils.isTablet ? 2 : 1,
              child: Assets.images.blueCar.image()), // Scale for consistency
        ),
      ],
    );
  }
}
