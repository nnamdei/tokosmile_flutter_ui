import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/shared/constants/colors.dart';


Padding reviewChip({required String text}) {
  return Padding(
    padding: EdgeInsets.only(right:8.0.w),
    child: Container(
      height: 25,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.primaryOpacity.withOpacity(0.2),
        border: Border.all(
          color: AppColors.primary,
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style:  TextStyle(
            fontSize: 11.sp,
            color: AppColors.primary,
          ),
        ),
      ),
    ),
  );
}
