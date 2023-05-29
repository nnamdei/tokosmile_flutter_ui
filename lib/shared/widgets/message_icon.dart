import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:badges/src/badge.dart' as badge;
import 'package:tokosmileui/shared/constants/colors.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      position: const BadgePosition(start: 15, bottom: 30),
      badgeColor: AppColors.notifBg,
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(5),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
      badgeContent: const Text(
        '9+',
        style: TextStyle(color: Colors.white),
      ),
      showBadge: true,
      child: const Icon(
        Icons.comment_outlined,
        color: AppColors.iconColor,
        size: 30,
      ),
    );
  }
}
