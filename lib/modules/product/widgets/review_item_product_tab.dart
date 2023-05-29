import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/view_model/reviews.dart';
import 'package:tokosmileui/modules/product/widgets/review_chip.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/constants/images.dart';

import 'rating_item.dart';


Padding reviewTab({
  required Product product,
  required Size size,
  required Reviews reviewData,
  required String currentReviewTag,
  required List<String> reviewTags,
  required Function changeReviewTag,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review & Ratings:',
          style: TextStyle(
            color: AppColors.indicatorColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(
                        color: AppColors.indicatorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '/ 5.0',
                      style: TextStyle(
                        color: AppColors.greyFontColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                RatingBar(
                  initialRating: product.rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: Image.asset(fullStar),
                    half: Image.asset(halfStar),
                    empty: Image.asset(emptyStar),
                  ),
                  itemPadding: const EdgeInsets.only(right: 1.0),
                  onRatingUpdate: (double value) {},
                ),
                const SizedBox(height: 30),
                Text(
                  '${product.reviews.length}k Reviews',
                  style: TextStyle(
                      color: AppColors.greyFontColor, fontSize: 16.sp),
                )
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: const [
                  RatingItem(
                    index: '5',
                    figure: '1.5k',
                    progressValue: 0.8,
                  ),
                  RatingItem(
                    index: '4',
                    figure: '710',
                    progressValue: 0.4,
                  ),
                  RatingItem(
                    index: '3',
                    figure: '140',
                    progressValue: 0.3,
                  ),
                  RatingItem(
                    index: '2',
                    figure: '100',
                    progressValue: 0.2,
                  ),
                  RatingItem(
                    index: '1',
                    figure: '120',
                    progressValue: 0.1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'Review with images & videos',
          style: TextStyle(
            color: AppColors.indicatorColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: product.otherImgs.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(3, 8.0, 8.0, 8.0),
              child: Container(
                height: 20,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.otherImgsBg,
                ),
                child: Image.asset(
                  product.otherImgs[index],
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Divider(
          color: AppColors.storeColor,
          thickness: 0.4,
        ),
        const SizedBox(height: 30),
        Text(
          'Top Reviews:',
          style: TextStyle(
            color: AppColors.indicatorColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Showing 3 of ${product.reviews.length}k reviews',
              style: TextStyle(
                color: AppColors.greyFontColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.boxBg,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.greyFontColor,
                ),
                underline: Container(),
                value: currentReviewTag,
                items: reviewTags
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) => changeReviewTag(value),
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height / 1.6,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 15),
            itemCount: product.reviews.length,
            itemBuilder: (context, index) {
              var item = reviewData.findById(product.reviews[index]);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.boxBg,
                            backgroundImage: AssetImage(item.imgUrl),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item.username,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),

                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(
                                fullStar,
                                width: 20.w,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                item.rating.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => {},
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: AppColors.greyFontColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  //
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      reviewChip(text: 'Positive condition'),
                      reviewChip(text: 'Nice and soft'),
                      reviewChip(text: 'Smooth and new'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    item.review,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => {},
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Helpful ?',
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 14.sp),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Yesterday',
                        style: TextStyle(
                          color: AppColors.greyFontColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: AppColors.storeColor,
                    thickness: 0.4,
                  ),
                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        )
      ],
    ),
  );
}
