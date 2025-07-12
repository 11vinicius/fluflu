import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/components/Transferencia.dart';
import 'package:teste/controllerz/transferenciaController.dart';
import 'package:teste/controllerz/transferenciaListController.dart';
import 'package:teste/models/TransfereciaModel.dart';

class Listatransferecias extends StatelessWidget {
  Listatransferecias({super.key});

  final controller = Get.put(TransfereciaListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.transferencias.map((t) {
        return Transferencia(
          transferencia: TransfereciaModel(t.id, t.valor, t.numeroConta),
        );
      }).toList(),
    );
  }
}
