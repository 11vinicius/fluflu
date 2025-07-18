import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/modules/transferencia/components/ListaTransferecias.dart';
import 'package:teste/shared/components/CustomDrawer.dart';
import 'package:teste/shared/components/CustomFloatButton.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TransferenciaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showMenu: true, title: 'Trânsferencia'),
      drawer: CustomDrawer(),
      floatingActionButton: Obx(
        () => !controller.isLoading.value
            ? CustomFloatButton(
                icon: Icons.add,
                onPressed: () =>
                    Navigator.pushNamed(context, '/transferencia/create'),
              )
            : SizedBox.shrink(),
      ),
      body: Listatransferecias(),
    );
  }
}
