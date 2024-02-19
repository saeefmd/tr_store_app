import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/common/widgets/app_network_image.dart';
import 'package:tr_store_app/common/widgets/global_app_bar.dart';
import 'package:tr_store_app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store_app/modules/cart/models/cart_item_model.dart';
import 'package:tr_store_app/utils/app_constraints.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'Cart',
        enableLeading: true,
        enableCart: false,
      ),
      body: SafeArea(
        child: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: controller.cartItems.length,
        shrinkWrap: false,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, i) {
          return _singleCartItemView(controller.cartItems[i]);
        },
      ),
    ));
  }

  Widget _singleCartItemView(CartItemModel item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                height: 80,
                child: AppNetworkImage(
                  url: item.productImage ?? '',
                  boxFit: BoxFit.fill,
                ),
              ),
              AppConstraints.width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${item.productTitle ?? ''}\n\n',
                            style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppConstraints.width5,
                        InkWell(
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red.shade400,
                            size: 18,
                          ),
                          onTap: () {
                            controller.deleteCartItem(item.cartItemId);
                          },
                        )
                      ],
                    ),
                    AppConstraints.height10,
                    Text(
                      'Price : \$${item.productPrice}',
                      style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
