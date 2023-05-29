import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/models/icon_section.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.item,
    required this.index,
    required this.setCurrentIconSection,
    required this.currentIconSectionIndex,
  }) : super(key: key);
  final IconSection item;
  final int index;
  final Function setCurrentIconSection;
  final int currentIconSectionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 13,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setCurrentIconSection(index),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: currentIconSectionIndex == index
                    ? AppColors.indicatorColor
                    : AppColors.boxBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  size:16,
                  color: currentIconSectionIndex == index
                      ? Colors.white
                      : AppColors.iconColor,
                ),
              ),
            ),
          ),
          10.height,
          Text(
            item.title,
            style: const TextStyle(color: AppColors.greyFontColor),
          ),
        ],
      ),
    );
  }
}
