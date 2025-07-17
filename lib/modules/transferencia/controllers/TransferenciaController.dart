import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/models/TransfereciaModel.dart';
import 'package:teste/modules/transferencia/services/TransferenciaService.dart';
import 'package:teste/shared/components/CustomToast.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';
import 'package:teste/shared/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class TransferenciaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final service = TransferenciaService();
  RxList<TransfereciaModel> transferencias = <TransfereciaModel>[].obs;
  Rx<DateTime> dataNascimento = DateTime.now().obs;

  RxString moeda = 'BRL'.obs;

  @override
  void onInit() {
    findAll();
    super.onInit();
  }

  Future<void> make() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      final numero = int.tryParse(numeroConta.text);
      final valor = parseMoneyBr(valorConta.text);
      final uuid = Uuid();
      final id = uuid.v4();
      await service.createTransferencias(TransfereciaModel(id, valor, numero!));
      Get.offAllNamed("/transferencia/home");
    } catch (e) {
      isLoading.value = false;
      CustomToast(
        title: 'Error',
        message: 'erro ao salvar transferencia',
        bgColor: ColorsTheme.red,
      );
    }
  }

  Future<void> findAll() async {
    try {
      isLoading.value = true;

      final res = await service.getTransferencias();

      if (res.statusCode == 200 && res.body != null) {
        final lista = (res.body['results'] as List<dynamic>)
            .map((e) => TransfereciaModel.fromMap(e as Map<String, dynamic>))
            .toList();

        transferencias.value = lista;
      } else {
        CustomToast(
          title: 'Error',
          message: 'Erro ao buscar transferências',
          bgColor: ColorsTheme.red,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
