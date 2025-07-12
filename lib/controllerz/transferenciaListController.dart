import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/services/TransferenciaService.dart';

class TransfereciaListController extends GetxController {
  final service = TransferenciaService();

  RxList<TransfereciaModel> transferencias = <TransfereciaModel>[].obs;

  @override
  void onInit() {
    // findAll();
    super.onInit();
  }

  Future<void> findAll() async {
    final res = await service.getTransferencias();
    print(res.body);
  }
}
