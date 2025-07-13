import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/CreateController.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateController>(() => CreateController());
  }
}
