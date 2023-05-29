import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/constants/images.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    Key? key,
    required this.index,
    required this.figure,
    required this.progressValue,
  }) : super(key: key);
  final String index;
  final String figure;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            fullStar,
            width: 20,
          ),
          5.width,
          Text(index),
          10.width,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    value: progressValue,
                    minHeight: 10,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              5.width,
              Text(figure,
                  style: TextStyle(
                      color: AppColors.indicatorColor,
                      fontWeight: FontWeight.w500))
            ],
          ),
        ],
      ),
    );
  }
}
