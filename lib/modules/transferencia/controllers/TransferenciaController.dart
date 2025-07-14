import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/modules/transferencia/services/TransferenciaService.dart';
import 'package:teste/shared/components/CustomInputSelect.dart';
import 'package:teste/shared/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class TransferenciaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final service = TransferenciaService();
  RxList<TransfereciaModel> transferencias = <TransfereciaModel>[].obs;

  final List<SelectOption> moedas = [
    SelectOption(value: 'BRL', label: 'R\$'),
    SelectOption(value: 'USD', label: 'US\$'),
    SelectOption(value: 'EUR', label: '€'),
    SelectOption(value: 'GBP', label: '£'),
    SelectOption(value: 'JPY', label: '¥'),
    SelectOption(value: 'ARS', label: 'AR\$'),
    SelectOption(value: 'CAD', label: 'C\$'),
    SelectOption(value: 'AUD', label: 'A\$'),
    SelectOption(value: 'CNY', label: '元'),
    SelectOption(value: 'CHF', label: 'CHF'),
  ];

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

    isLoading.value = true;
    final numero = int.tryParse(numeroConta.text);
    final valor = parseMoneyBr(valorConta.text);
    final uuid = Uuid();
    final id = uuid.v4();

    await service.createTransferencias(TransfereciaModel(id, valor, numero!));

    numeroConta.text = '';
    valorConta.text = '';
    Get.offAllNamed("/");
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
