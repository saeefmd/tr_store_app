import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/common/widgets/app_cart_widget.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    Key? key,
    required this.title,
    this.enableLeading,
    this.enableCart
  }) : super(key: key);

  final String title;
  final bool? enableLeading;
  final bool? enableCart;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: enableLeading ?? false ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          )
      ) : null,
      actions: [
        enableCart ?? true ? AppCartWidget() : Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
