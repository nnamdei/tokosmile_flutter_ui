import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/shared/constants/colors.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({
    Key? key,
    required this.product,
    required this.cartData,
    required this.addToCart,
    required this.removeFromCart,
  }) : super(key: key);

  final Product product;
  final Cart cartData;
  final Function addToCart;
  final Function removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    color: AppColors.greyFontColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 25.sp,
                  ),
                )
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.shopping_bag_outlined,
                            color: Colors.white),
                        const SizedBox(width: 15),
                        Text(
                          cartData.findItemQuantity(product.id).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => cartData.isItemOnCart(product.id)
                      ? removeFromCart()
                      : addToCart(),
                  child: Container(
                    height: 50.h,
                    width: 120.w,
                    decoration: const BoxDecoration(
                      color: AppColors.indicatorColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        cartData.isItemOnCart(product.id)
                            ? 'Remove From Cart'
                            : 'Add To Cart',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
