import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/modules/home/view_model/category.dart';
import 'package:tokosmileui/modules/home/view_model/product.dart';
import 'package:tokosmileui/modules/product/view_model/reviews.dart';
import 'package:tokosmileui/modules/product/view_model/stores.dart';
import 'package:tokosmileui/modules/product/widgets/about_item_product_tab.dart';
import 'package:tokosmileui/modules/product/widgets/cart_icon.dart';
import 'package:tokosmileui/modules/product/widgets/product_details_bottom_sheet.dart';
import 'package:tokosmileui/modules/product/widgets/product_details_img_section.dart';
import 'package:tokosmileui/modules/product/widgets/review_item_product_tab.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/enums/prod_status.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  var currentImageIndex = 0; // for storing current index of the image
  TabController? _tabController;

  var currentReviewTag = 'Popular';
  List<String> reviewTags = ['Popular', 'Trending', 'Latest', 'Yesterday'];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 500 milliseconds
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Initialize the animation to fade from 0 to 1 while sliding up from 50 pixels below the view
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation
    _controller.forward();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // change review tag
  void changeReviewTag(String value) {
    setState(() {
      currentReviewTag = value;
    });
  }

  // set image index
  void setImageIndex(int index) {
    setState(() {
      currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = data['product_id'];
    ProdStatus prodStatus = data['prodStatus'];
    final productData = Provider.of<Products>(context);
    final storeData = Provider.of<Stores>(context);
    final cartData = Provider.of<Cart>(context);
    final categoryData = Provider.of<Categories>(context);
    final reviewData = Provider.of<Reviews>(context);
    Product product = productData.findById(id);
    List<Product> products =
        Provider.of<Products>(context, listen: false).recommendProducts;

    // add to cart
    void addToCart() {
      cartData.addItemToCart(
        product.id,
        product.name,
        product.price,
        product.imageUrl,
      );
    }

    // remove from cart
    void removeFromCart() {
      cartData.removeFromCart(product.id);
    }

    // // navigate to store
    // void navigateToStore() {
    //   Navigator.of(context).pushNamed(
    //     Router.storeScreen,
    //     arguments: {'store_id': product.storeId},
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                color: AppColors.iconColor,
                size: 32,
              ),
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () => productData.toggleIsFavorite(product.id, prodStatus),
            // toggling isFavorite from product provider
            child: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color:
                  product.isFavorite ? AppColors.notifBg : AppColors.iconColor,
              size: 30,
            ),
          ),
          10.width,
          const Icon(
            Icons.share_outlined,
            color: AppColors.iconColor,
            size: 30,
          ),
          10.width,
          const CartIcon(),
          18.width,
        ],
      ),
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          )),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productDetailsImageSection(
                  size,
                  product,
                  currentImageIndex,
                  setImageIndex,
                ),
                15.height,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.storefront, color: AppColors.storeColor),
                    10.width,
                    Text(
                      storeData.findById(product.storeId).name,
                      style: const TextStyle(color: AppColors.storeColor),
                    )
                  ],
                ),
                10.height,
                Text(
                  product.name,
                  style: TextStyle(
                      color: AppColors.indicatorColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.starBg,
                          // size: 15,
                        ),
                        3.width,
                        Text(
                          '${product.rating} Ratings',
                          style: TextStyle(
                            color: AppColors.greyFontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '•',
                      style: TextStyle(
                        color: AppColors.greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.sp,
                      ),
                    ),
                    Text(
                      '${product.reviews.length}k Reviews',
                      style: TextStyle(
                        color: AppColors.greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      '•',
                      style: TextStyle(
                        color: AppColors.greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.sp,
                      ),
                    ),
                    Text(
                      '${product.soldNumber}k Sold',
                      style: TextStyle(
                        color: AppColors.greyFontColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                15.height,
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'About Item'),
                    Tab(text: 'Reviews'),
                  ],
                  unselectedLabelColor: AppColors.greyFontColor,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 1.6,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // ABOUT PRODUCT TAB
                      AboutItemTab(
                        product: product,
                        categoryData: categoryData,
                        storeData: storeData,
                        size: size,
                        products: products,
                        productData: productData,
                        cartData: cartData,
                        // navigateToStore: navigateToStore,
                      ),

                      // REVIEW TAB
                      reviewTab(
                        product: product,
                        size: size,
                        reviewData: reviewData,
                        currentReviewTag: currentReviewTag,
                        reviewTags: reviewTags,
                        changeReviewTag: changeReviewTag,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ProductDetailsBottomSheet(
        product: product,
        cartData: cartData,
        addToCart: addToCart,
        removeFromCart: removeFromCart,
      ),
    );
  }
}
