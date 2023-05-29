import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/view_model/reviews.dart';
import 'package:tokosmileui/modules/product/view_model/stores.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<Categories>(
    create: (context) => Categories(),
  ),
  ChangeNotifierProvider<Cart>(
    create: (context) => Cart(),
  ),
  ChangeNotifierProvider<Products>(
    create: (context) => Products(),
  ),
  ChangeNotifierProvider<Reviews>(
    create: (context) => Reviews(),
  ),
  ChangeNotifierProvider<Stores>(
    create: (context) => Stores(),
  ),
];
