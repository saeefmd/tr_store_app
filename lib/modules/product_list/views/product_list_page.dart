import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/app_routes/routes_path.dart';
import 'package:tr_store_app/common/widgets/app_custom_button.dart';
import 'package:tr_store_app/common/widgets/app_network_image.dart';
import 'package:tr_store_app/common/widgets/global_app_bar.dart';
import 'package:tr_store_app/modules/product_list/controllers/product_list_controller.dart';
import 'package:tr_store_app/modules/product_list/models/products_model.dart';
import 'package:tr_store_app/modules/product_list/widgets/shimmer_product_list.dart';
import 'package:tr_store_app/utils/app_constraints.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'TR STORE',
      ),
      body: SafeArea(
        child: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return Obx(() => controller.productsLoading.value ? const ShimmerProductList() :
      GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 200
        ),
        itemCount: controller.products.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return _singleProductView(controller.products[i]);
        },
      ));
  }

  Widget _singleProductView(ProductModel product) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          Get.toNamed(RoutesPath.productDetailsPage, arguments: product);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: Get.width,
                child: AppNetworkImage(
                  url: product.image ?? '',
                  boxFit: BoxFit.fill,
                ),
              ),
              AppConstraints.height5,
              Text(
                '${product.title ?? ''}\n',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              AppConstraints.height5,
              Text(
                'Price : \$${product.userId}',
                style: Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              AppConstraints.height10,
              AppCustomButton(
                onTap: () {
                  controller.addToCart(product);
                },
                height: 32,
                borderColor: Colors.grey.shade300,
                borderWidth: 1,
                elevation: 0,
                centerWidget: Text(
                  'ADD TO CART',
                  style: Get.textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
