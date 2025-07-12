import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/services/TransferenciaService.dart';
import 'package:teste/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class TransfereciaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final uuid = Uuid();

  final service = TransferenciaService();

  final List<TransfereciaModel> transferencias = [];

  Future<void> criar() async {
    if (!formKey.currentState!.validate()) {
      print('erro');
    }

    final numero = int.tryParse(numeroConta.text);
    final valor = parseMoneyBr(valorConta.text);
    final uuid = Uuid();
    final id = uuid.v4();

    final res = await service.createTransferencias(
      TransfereciaModel(id, valor, numero!),
    );

    print(res.body);
    return;
  }
}
