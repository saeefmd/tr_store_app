import 'package:get/get.dart';
import 'package:tr_store_app/modules/product_list/controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
  }
}