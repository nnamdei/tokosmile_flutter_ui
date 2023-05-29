import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/models/carousel_item.dart';
import 'customIndicator.dart';

Container carouselSingleSlider({
  required CarouselItem item,
  required BuildContext context,
  required int carouselLength,
  required int currentCarouselIndex,
  required Function action,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(item.imgSrc),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: 18.0,
        left: 18.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.hashTag,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomIndicator(
                dotsCount: carouselLength,
                position: currentCarouselIndex,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            item.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 36.sp,
            ),
          ),
          5.height,
          Text(
            item.desc,
            style: const TextStyle(color: Colors.grey),
          ),
          10.height,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.indicatorColor,
            ),
            onPressed: () => action(),
            child: const Text('Check this out'),
          )
        ],
      ),
    ),
  );
}
