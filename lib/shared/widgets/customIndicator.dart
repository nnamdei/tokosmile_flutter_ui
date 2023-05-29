import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/shared/constants/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    required this.dotsCount,
    required this.position,
  }) : super(key: key);
  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        color: Colors.grey,
        size: const Size.square(4.0),
        activeSize: const Size(18.0, 5.0),
        activeColor: AppColors.indicatorColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0.r),
        ),
        spacing: EdgeInsets.only(right: 4.w),
      ),
    );
  }
}
