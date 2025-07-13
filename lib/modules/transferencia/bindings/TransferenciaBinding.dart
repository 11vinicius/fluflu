import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';

class TransferenciaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferenciaController>(() => TransferenciaController());
  }
}
