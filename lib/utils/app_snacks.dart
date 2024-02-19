import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnacks {

  static void showDefault(String title, String message) {
    Get.snackbar(
        title,
        message,
        icon: const Icon(
          Icons.message_outlined,
          size: 20,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
    );
  }

  static void showError(String title, String message) {
    Get.snackbar(
        title,
        message,
        icon: const Icon(
          Icons.error_outline,
          size: 20,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
    );
  }

  static void showSuccess(String title, String message) {
    Get.snackbar(
        title,
        message,
        icon: const Icon(
          Icons.check_box_outlined,
          size: 20,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2)
    );
  }

  static void showWarning(String title, String message) {
    Get.snackbar(
        title,
        message,
        icon: const Icon(
          Icons.warning_amber_outlined,
          size: 20,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
    );
  }
}