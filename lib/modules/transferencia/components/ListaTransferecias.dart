import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';
import 'package:teste/shared/components/CustomLoading.dart';
import 'package:teste/modules/transferencia/components/Transferencia.dart';
import 'package:teste/modules/transferencia/models/TransfereciaModel.dart';

class Listatransferecias extends StatelessWidget {
  Listatransferecias({super.key});

  final TransferenciaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.findAll();
      },
      child: Obx(
        () => !controller.isLoading.value
            ? ListView.builder(
                itemCount: controller.transferencias.length,
                itemBuilder: (context, index) {
                  final item = controller.transferencias[index];
                  return Transferencia(
                    transferencia: TransfereciaModel(
                      item.id,
                      item.valor,
                      item.numeroConta,
                    ),
                  );
                },
              )
            : CustomLoading(),
      ),
    );
  }
}
