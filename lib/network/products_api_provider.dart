import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tr_store_app/modules/product_list/models/products_model.dart';

import 'dio_provider.dart';

Future<List<ProductModel>?> getAllProductsApi() async {

  var response;

  try {
    Dio dio = dioProvider.getDio();
    response = await dio.get('posts');
  } on DioException catch (e) {
    log(e.toString());
  }

  if (response != null) {
    List<ProductModel> responseModel = productModelFromJson(json.encode(response.data));
    return responseModel;
  }

  return null;
}