import 'package:get/get.dart';
import 'package:teste/controllerz/transferenciaController.dart';

class TransferenciaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransfereciaController>(() => TransfereciaController());
  }
}
