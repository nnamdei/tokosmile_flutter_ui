import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:readmore/readmore.dart' as read;
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/view_model/stores.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/enums/prod_status.dart';
import 'package:tokosmileui/shared/widgets/product_grid_builder.dart';
import 'k_wrap.dart';

class AboutItemTab extends StatelessWidget {
  const AboutItemTab({
    Key? key,
    required this.product,
    required this.categoryData,
    required this.storeData,
    required this.size,
    required this.products,
    required this.productData,
    required this.cartData,
    this.navigateToStore,
  }) : super(key: key);

  final Product product;
  final Categories categoryData;
  final Stores storeData;
  final Size size;
  final List<Product> products;
  final Products productData;
  final Cart cartData;
  final Function? navigateToStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(title: 'Brand', data: product.brandName),
              KWrap(title: 'Color', data: product.colorName),
            ],
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Category',
                data: categoryData.findById(product.catId).title,
              ),
              KWrap(title: 'Material', data: product.material),
            ],
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Condition',
                data: product.condition,
              ),
              KWrap(title: 'Heavy', data: product.heavy),
            ],
          ),
          30.height,
          const Divider(
            color: AppColors.storeColor,
            thickness: 0.4,
          ),
          30.height,
          Text(
            'Description:',
            style: TextStyle(
              color: AppColors.indicatorColor,
              fontSize: 16.sp,
            ),
          ),
          20.height,
          SizedBox(
            height: 140.h,
            child: ListView.builder(
              itemCount: product.descriptionList.length,
              itemBuilder: (context, index) {
                var item = product.descriptionList[index];

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '• $item',
                    style: TextStyle(
                      color: AppColors.greyFontColor,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
            ),
          ),
          10.height,
          read.ReadMoreText(
            product.description,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: read.TrimMode.Line,
            trimCollapsedText: 'Show more ⌄',
            trimExpandedText: 'Show less ^',
            style: const TextStyle(
              color: AppColors.greyFontColor,
              fontSize: 16,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          30.height,
          const Divider(
            color: AppColors.storeColor,
            thickness: 0.4,
          ),
          20.height,
          const Text(
            'Shipping Information:',
            style: TextStyle(
              color: AppColors.indicatorColor,
              fontSize: 16,
            ),
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Delivery:',
                data: product.shippingInformation.delivery,
              )
            ],
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Shipping:',
                data: product.shippingInformation.shipping,
              )
            ],
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Arrival:',
                data: product.shippingInformation.arrival,
              )
            ],
          ),
          30.height,
          const Divider(
            color: AppColors.storeColor,
            thickness: 0.4,
          ),
          30.height,
          Text(
            'Seller Information:',
            style: TextStyle(
              color: AppColors.indicatorColor,
              fontSize: 16.sp,
            ),
          ),
          20.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.storeId,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    storeData.findById(product.storeId).imgUrl,
                  ),
                ),
              ),
              15.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeData.findById(product.storeId).name,
                    style: TextStyle(
                      color: AppColors.indicatorColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  10.height,
                  Text(
                    'Active 5m ago | 94.3 Positive feedback',
                    style: TextStyle(
                      color: AppColors.greyFontColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  10.height,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      side: const BorderSide(color: AppColors.primary),
                    ),
                    // onPressed: () => navigateToStore(),
                    onPressed: () {},
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.storefront, color: AppColors.primary),
                        10.width,
                        Text(
                          'Visit store',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended Products:',
                style: TextStyle(
                  color: AppColors.indicatorColor,
                  fontSize: 16.sp,
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  'See more',
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
          20.height,
          SizedBox(
            height: size.height / 3,
            child: ProductGridBuilder(
              prodStatus: ProdStatus.recommendedProducts,
              products: products,
              productsData: productData,
              categoryData: categoryData,
              cartData: cartData,
            ),
          )
        ],
      ),
    );
  }
}
