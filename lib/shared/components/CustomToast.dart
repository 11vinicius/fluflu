import 'package:get/get.dart';
import 'package:flutter/material.dart';

void CustomToast({
  required String title,
  required String message,
  Color bgColor = Colors.green,
  Duration duration = const Duration(seconds: 12),
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: bgColor,
    colorText: Colors.white,
    margin: const EdgeInsets.all(12),
    borderRadius: 8,
    duration: duration,
    mainButton: TextButton.icon(
      onPressed: Get.closeCurrentSnackbar,
      icon: const Icon(Icons.close, color: Colors.white, size: 20),
      label: const SizedBox.shrink(),
    ),
  );
}
