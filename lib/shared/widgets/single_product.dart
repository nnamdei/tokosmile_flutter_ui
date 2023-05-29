import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/enums/prod_status.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    required this.item,
    required this.productsData,
    required this.categoryData,
    required this.cartData,
    required this.prodStatus,
  }) : super(key: key);

  final Product item;
  final Products productsData;
  final Categories categoryData;
  final Cart cartData;
  final ProdStatus prodStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 105,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.imageBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Hero(
              tag: item.id,
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 5,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () =>
                      productsData.toggleIsFavorite(item.id, prodStatus),
                  child: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: item.isFavorite
                        ? AppColors.notifBg
                        : AppColors.iconColor,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => cartData.addItemToCart(
                      item.id, item.name, item.price, item.imageUrl),
                  child: Icon(
                    cartData.isItemOnCart(item.id)
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                    color: cartData.isItemOnCart(item.id)
                        ? AppColors.notifBg
                        : AppColors.iconColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryData.findById(item.catId).title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.greyFontColor,
                  ),
                ),
                // const SizedBox(height: 3),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.sp,
                  ),
                ),
                // const SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.starBg,
                  size: 15,
                ),
                const SizedBox(width: 3),
                Text(
                  '${item.rating} | ${item.soldNumber}',
                  style: const TextStyle(
                      color: AppColors.greyFontColor,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: Text(
              '\$${item.price}',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
