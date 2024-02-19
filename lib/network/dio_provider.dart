import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../utils/app_constants.dart';

DioProvider dioProvider = DioProvider();

BaseOptions options = BaseOptions(
  baseUrl: AppConstants.baseUrl,
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
  headers: {HttpHeaders.contentTypeHeader: 'application/json'},
);

class DioProvider {

  Dio getDio() => Dio(options);
}