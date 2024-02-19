import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/common/widgets/app_custom_button.dart';
import 'package:tr_store_app/common/widgets/app_network_image.dart';
import 'package:tr_store_app/common/widgets/global_app_bar.dart';
import 'package:tr_store_app/modules/product_details/controllers/product_details_controller.dart';
import 'package:tr_store_app/utils/app_colors.dart';
import 'package:tr_store_app/utils/app_constraints.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'Product Details',
        enableLeading: true,
      ),
      body: SafeArea(
          child: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height / 4.2,
                  child: Obx(() => AppNetworkImage(
                    url: controller.product.value.image ?? '',
                    boxFit: BoxFit.fill,
                  )),
                ),
                AppConstraints.height15,
                Obx(() => Text(
                  controller.product.value.title ?? '',
                  style: Get.textTheme.headlineMedium,
                )),
                AppConstraints.height10,
                Obx(() => Text(
                  'Price : \$${controller.product.value.userId}',
                  style: Get.textTheme.headlineMedium,
                )),
                AppConstraints.height20,
                Obx(() => Text(
                  controller.product.value.content ?? '',
                  style: Get.textTheme.titleLarge,
                )),
                AppConstraints.height80,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppCustomButton(
              backgroundColor: AppColors.primaryPurple,
              centerWidget: Text(
                'ADD TO CART',
                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              onTap: () {
                controller.addToCart();
              },
            ),
          )
        ],
      ),
    );
  }
}
