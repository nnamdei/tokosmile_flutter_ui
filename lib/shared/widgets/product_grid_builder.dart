import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/product_detail.dart';
import 'package:tokosmileui/shared/enums/prod_status.dart';
import 'package:tokosmileui/shared/route_manager.dart';
import 'single_product.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    Key? key,
    required this.products,
    required this.productsData,
    required this.categoryData,
    required this.cartData,
    required this.prodStatus,
  }) : super(key: key);

  final List<Product> products;
  final Products productsData;
  final Categories categoryData;
  final Cart cartData;
  final ProdStatus prodStatus;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        Product item = products[index];
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            RouteManager.productDetails,
            arguments: {
              'product_id': item.id,
              'prodStatus': prodStatus,
            },
          ),
          child: SingleProduct(
            prodStatus: prodStatus,
            item: item,
            productsData: productsData,
            categoryData: categoryData,
            cartData: cartData,
          ),
        );
      },
    );
  }
}
