import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/modules/transferencia/services/TransferenciaService.dart';
import 'package:teste/shared/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class TransferenciaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final uuid = Uuid();
  final service = TransferenciaService();
  RxList<TransfereciaModel> transferencias = <TransfereciaModel>[].obs;

  @override
  void onInit() {
    findAll();
    super.onInit();
  }

  Future<void> criar() async {
    if (!formKey.currentState!.validate()) {
      print('erro');
      return;
    }

    isLoading.value = true;
    final numero = int.tryParse(numeroConta.text);
    final valor = parseMoneyBr(valorConta.text);
    final uuid = Uuid();
    final id = uuid.v4();

    final res = await service.createTransferencias(
      TransfereciaModel(id, valor, numero!),
    );

    numeroConta.text = '';
    valorConta.text = '';
    Get.offAllNamed("/");
  }

  Future<void> findAll() async {
    final res = await service.getTransferencias();

    final lista = (res.body['results'] as List<dynamic>)
        .map((e) => TransfereciaModel.fromMap(e as Map<String, dynamic>))
        .toList();

    transferencias.value = lista;
    isLoading.value = false;
  }
}
