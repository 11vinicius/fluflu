import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/modules/transferencia/services/TransferenciaService.dart';

class ListController extends GetxController {
  final service = TransferenciaService();

  RxList<TransfereciaModel> transferencias = <TransfereciaModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    findAll();
    super.onInit();
  }

  Future<void> findAll() async {
    isLoading.value = true;
    final res = await service.getTransferencias();

    final lista = (res.body['results'] as List<dynamic>)
        .map((e) => TransfereciaModel.fromMap(e as Map<String, dynamic>))
        .toList();

    transferencias.value = lista;
    isLoading.value = false;
  }
}
