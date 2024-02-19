import 'package:get/get.dart';
import 'package:tr_store_app/app_routes/routes_path.dart';
import 'package:tr_store_app/modules/cart/bindings/cart_binding.dart';
import 'package:tr_store_app/modules/cart/views/cart_page.dart';
import 'package:tr_store_app/modules/product_details/bindings/product_details_binding.dart';
import 'package:tr_store_app/modules/product_details/views/product_details_page.dart';
import 'package:tr_store_app/modules/product_list/bindings/product_list_binding.dart';
import 'package:tr_store_app/modules/product_list/views/product_list_page.dart';

class Routes {

  static final List<GetPage> routes = [
    GetPage(
      name: RoutesPath.productListPage,
      page: () =>  const ProductListPage(),
      binding: ProductListBinding()
    ),
    GetPage(
      name: RoutesPath.productDetailsPage,
      page: () =>  const ProductDetailsPage(),
      binding: ProductDetailsBinding()
    ),
    GetPage(
        name: RoutesPath.cartPage,
        page: () =>  const CartPage(),
        binding: CartBinding()
    ),
  ];
}