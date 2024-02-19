import 'dart:developer';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tr_store_app/database/app_database.dart';
import 'package:tr_store_app/modules/cart/models/cart_item_model.dart';
import 'package:tr_store_app/modules/product_list/models/products_model.dart';
import 'package:tr_store_app/utils/app_snacks.dart';

import '../../../database/database_info.dart';

class CartController extends GetxController {

  late Database database;

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  @override
  void onReady() async {
    super.onReady();
    database = await AppDatabase.open();
    getCartItemsFromDb();
  }

  void getCartItemsFromDb() async {
    if (!database.isOpen) {
      database = await AppDatabase.open();
    }

    try {
      var query = 'SELECT * FROM ${DatabaseInfo.tableCartItems};';

      var data = await database.rawQuery(query);

      cartItems.clear();

      if (data.isNotEmpty) {
        for (int i=0; i<data.length; i++) {
          var map = {};
          data[i].forEach((key, value) => map[key] = value);

          cartItems.add(CartItemModel(
              cartItemId: map[DatabaseInfo.columnCartItemId],
              productId: map[DatabaseInfo.columnCartProductId],
              productTitle: map[DatabaseInfo.columnCartProductTitle],
              productDetails: map[DatabaseInfo.columnCartProductDetails],
              productImage: map[DatabaseInfo.columnCartProductImage],
              productPrice: map[DatabaseInfo.columnCartProductPrice],
            ),
          );
        }
      }

    } catch (exception) {
      log('Get Cart Item Exception : $exception');
    }
  }

  void insertCartItem(ProductModel product) async {

    for (CartItemModel cartItem in cartItems) {
      if (cartItem.productId == product.id) {
        AppSnacks.showWarning('Warning', 'Item Already Exists');
        return;
      }
    }

    if (!database.isOpen) {
      database = await AppDatabase.open();
    }

    try {
      var query = 'INSERT INTO ${DatabaseInfo.tableCartItems} '
          '(${DatabaseInfo.columnCartProductId}, ${DatabaseInfo.columnCartProductTitle}, '
          '${DatabaseInfo.columnCartProductDetails}, ${DatabaseInfo.columnCartProductImage}, '
          '${DatabaseInfo.columnCartProductPrice}) '
          'VALUES (?, ?, ?, ?, ?);';

      var values = [product.id, product.title, product.content, product.image, product.userId];

      int id = await database.rawInsert(query, values);

      if (id > 0) {
        AppSnacks.showSuccess('Success!', 'Item Added To Cart');
        getCartItemsFromDb();
      } else {
        AppSnacks.showError('Error!', 'Something Went Wrong');
      }

    } catch (exception) {
      log('Insert Cart Item Exception : $exception');
      AppSnacks.showError('Error!', 'Something Went Wrong');
    }
  }

  void deleteCartItem(int? cartItemId) async {
    if (!database.isOpen) {
      database = await AppDatabase.open();
    }

    try {
      var query = 'DELETE FROM ${DatabaseInfo.tableCartItems} WHERE '
          '${DatabaseInfo.columnCartItemId} = ?;';

      var values = [cartItemId];

      int id = await database.rawDelete(query, values);

      if (id > 0) {
        AppSnacks.showSuccess('Success', 'Item Removed');
        getCartItemsFromDb();
      } else {
        AppSnacks.showError('Error', 'Could not remove item');
      }

    } catch (exception) {
      log('Cart Item delete exception : $exception');
      AppSnacks.showError('Error', 'Something went wrong');
    }
  }
}