import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/shared/components/Transferencia.dart';
import 'package:teste/modules/transferencia/controllers/ListController.dart';
import 'package:teste/models/TransfereciaModel.dart';

class Listatransferecias extends StatelessWidget {
  Listatransferecias({super.key});

  final ListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: controller.transferencias.map((t) {
          return Transferencia(
            transferencia: TransfereciaModel(t.id, t.valor, t.numeroConta),
          );
        }).toList(),
      ),
    );
  }
}
