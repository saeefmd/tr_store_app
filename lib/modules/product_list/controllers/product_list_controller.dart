import 'package:get/get.dart';
import 'package:tr_store_app/modules/product_list/models/products_model.dart';
import 'package:tr_store_app/network/products_api_provider.dart';

import '../../cart/controllers/cart_controller.dart';

class ProductListController extends GetxController {

  String title = 'Product List Page';

  RxList<ProductModel> products = <ProductModel>[].obs;

  RxBool productsLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    getProducts();
  }

  void getProducts() async {

    productsLoading.value = true;

    getAllProductsApi().then((data) {
      products.value = data ?? [];
      productsLoading.value = false;
    });
  }

  void addToCart(ProductModel product) {
    CartController cartController = Get.find();
    cartController.insertCartItem(product);
  }
}