import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/modules/transferencia/services/TransferenciaService.dart';
import 'package:teste/shared/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class CreateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final uuid = Uuid();

  final service = TransferenciaService();

  final List<TransfereciaModel> transferencias = [];

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
    isLoading.value = false;
    Get.offAllNamed("/");
  }
}
