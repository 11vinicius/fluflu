import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool isLoading = false.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final avatar = TextEditingController();

  void save() {
    isLoading.value = true;
    print('ok');
    isLoading.value = false;
  }
}
