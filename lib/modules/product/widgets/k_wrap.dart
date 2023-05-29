import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/shared/constants/colors.dart';

class KWrap extends StatelessWidget {
  const KWrap({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '$title:',
          style: TextStyle(
            color: AppColors.greyFontColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.indicatorColor,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
