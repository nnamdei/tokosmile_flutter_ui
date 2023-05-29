import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/widgets/cart_icon.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/constants/images.dart';
import 'package:tokosmileui/shared/enums/prod_status.dart';
import 'package:tokosmileui/shared/models/carousel_item.dart';
import 'package:tokosmileui/shared/models/icon_section.dart';
import 'package:tokosmileui/shared/utils/utils.dart';
import 'package:tokosmileui/shared/widgets/carousel_single_slider.dart';
import 'package:tokosmileui/shared/widgets/custom_textfield.dart';
import 'package:badges/badges.dart';
import 'package:badges/src/badge.dart' as badge;
import 'package:tokosmileui/shared/widgets/customIndicator.dart';
import 'package:tokosmileui/shared/widgets/custom_icon.dart';
import 'package:tokosmileui/shared/widgets/message_icon.dart';
import 'package:tokosmileui/shared/widgets/product_grid_builder.dart';
import 'package:tokosmileui/shared/widgets/single_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 0;
      });
    });
  }

  int currentCarouselIndex = 0;
  int currentIconSectionIndex = 0;

  final List<IconSection> iconSections = [
    IconSection(icon: Icons.grid_view, title: 'Category'),
    IconSection(icon: Icons.flight, title: 'Flight'),
    IconSection(icon: Icons.receipt, title: 'Bill'),
    IconSection(icon: Icons.language, title: 'Data plan'),
    IconSection(icon: Icons.monetization_on, title: 'Top Up'),
  ];

  void checkItOut() {}

  void setCurrentIconSection(int index) {
    setState(() {
      currentIconSectionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products =
        Provider.of<Products>(context, listen: false).availableProducts;
    List<CarouselItem> carouselItems =
        Provider.of<Products>(context, listen: false).carouselItems;
    final productsData = Provider.of<Products>(context);
    final cartData = Provider.of<Cart>(context);
    final categoryData = Provider.of<Categories>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
        actions: [
          const CartIcon(),
          10.width,
          const MessageIcon(),
          10.width,
        ],
        title: CustomTextField(
          controller: searchController,
          filledColor: _isScrolled ? Colors.white : Colors.transparent,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 8, left: 12),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColors.textfieldBorderColor,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: carouselItems.length,
              itemBuilder: (context, index, i) {
                var item = carouselItems[index];
                return carouselSingleSlider(
                  item: item,
                  context: context,
                  carouselLength: carouselItems.length,
                  currentCarouselIndex: currentCarouselIndex,
                  action: checkItOut,
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) => setState(() {
                  currentCarouselIndex = index;
                }),
                height: logicalHeight() / 2.5,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,
              ),
            ),
            10.height,
            SizedBox(
              height: logicalHeight() / 8,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: iconSections.length,
                itemBuilder: (context, index) {
                  var item = iconSections[index];
                  return CustomIcon(
                    item: item,
                    index: index,
                    setCurrentIconSection: setCurrentIconSection,
                    currentIconSectionIndex: currentIconSectionIndex,
                  );
                },
              ),
            ),
            10.height,
            CustomIndicator(
              dotsCount: carouselItems.length,
              position: currentCarouselIndex,
            ),
            20.height,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Sale Product',
                    style: TextStyle(
                      color: AppColors.indicatorColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Text(
                    'See more',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: logicalHeight() / 1,
              child: ProductGridBuilder(
                prodStatus: ProdStatus.availableProducts,
                products: products,
                productsData: productsData,
                categoryData: categoryData,
                cartData: cartData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
