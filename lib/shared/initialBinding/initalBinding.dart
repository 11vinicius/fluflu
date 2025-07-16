import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransferenciaController());
  }
}
