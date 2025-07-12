import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/utils/formatMoneyToDouble.dart';
import 'package:uuid/uuid.dart';

class TransfereciaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final numeroConta = TextEditingController();
  final valorConta = TextEditingController();
  final uuid = Uuid();

  final List<TransfereciaModel> transferencias = [];

  void criar() {
    final numero = numeroConta.text;
    final valor = parseMoneyBr(valorConta.text);
    final uuid = Uuid();
    final id = uuid.v4();

    print(valor);

    // transferencias.addAll([
    //   TransfereciaModel(id, valor, int.tryParse(numero) ?? 0),
    // ]);

    // numeroConta.text = '';
    // valorConta.text = '';

    // Get.toNamed('/');
  }

  void delete(String id) {
    transferencias.removeWhere((t) => t.id == id);
  }
}
