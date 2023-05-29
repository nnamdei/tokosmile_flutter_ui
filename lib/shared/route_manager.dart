import 'package:tokosmileui/modules/product/product_detail.dart';

class RouteManager {
  static const String productDetails = '/productDetails';
}

final routes = {
  RouteManager.productDetails: (context) => const ProductDetails(),
};
