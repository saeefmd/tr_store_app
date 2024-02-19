import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store_app/app_routes/routes.dart';
import 'package:tr_store_app/app_routes/routes_path.dart';
import 'package:tr_store_app/app_theme.dart';
import 'package:tr_store_app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store_app/modules/product_list/bindings/product_list_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

void initialize() {
  Get.lazyPut(() => CartController(), fenix: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TR Store',
      theme: AppTheme.lightTheme(),
      getPages: Routes.routes,
      initialBinding: ProductListBinding(),
      initialRoute: RoutesPath.productListPage,
    );
  }
}
