import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:badges/src/badge.dart' as badge;
import 'package:tokosmileui/modules/home/view_model/cart.dart';
import 'package:tokosmileui/shared/constants/colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartData = Provider.of<Cart>(context);

    return InkWell(
      onTap: () {},
      child: badge.Badge(
        position: const BadgePosition(start: 15, bottom: 30),
        badgeColor: AppColors.notifBg,
        shape: BadgeShape.square,
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 2),
        badgeContent: Text(
          cartData.itemCount.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        showBadge: true,
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: AppColors.iconColor,
          size: 30,
        ),
      ),
    );
  }
}
