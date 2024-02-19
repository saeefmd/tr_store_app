import 'package:get/get.dart';
import 'package:tr_store_app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store_app/modules/product_list/models/products_model.dart';

class ProductDetailsController extends GetxController {

  Rx<ProductModel> product = ProductModel().obs;

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments != null) {
      product.value = Get.arguments;
    }
  }

  void addToCart() {
    CartController cartController = Get.find();
    cartController.insertCartItem(product.value);
  }
}