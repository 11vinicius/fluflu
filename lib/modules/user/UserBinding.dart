import 'package:get/get.dart';
import 'package:teste/modules/user/controllers/UserController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
