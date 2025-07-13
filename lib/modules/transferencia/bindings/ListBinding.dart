import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/ListController.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController());
  }
}
