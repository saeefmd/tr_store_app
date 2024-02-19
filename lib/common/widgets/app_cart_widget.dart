import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/modules/cart/controllers/cart_controller.dart';

import '../../app_routes/routes_path.dart';

class AppCartWidget extends StatelessWidget {
  AppCartWidget({Key? key}) : super(key: key);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => badges.Badge(
      position: badges.BadgePosition.custom(start: 5, top: 5),
      showBadge: cartController.cartItems.isNotEmpty ? true : false,
      badgeAnimation: const badges.BadgeAnimation.slide(
        toAnimate: false,
      ),
      badgeStyle: const badges.BadgeStyle(
        elevation: 0,
        badgeColor: Colors.red,
        padding: EdgeInsets.all(4)
      ),
      badgeContent:
      Text(
        cartController.cartItems.length.toString(),
        style: Get.textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
      child:
      Container(
        alignment: Alignment.center,
        child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Get.toNamed(RoutesPath.cartPage);
            }),
      ),
    ));
  }
}