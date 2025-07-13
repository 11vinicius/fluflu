import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/shared/components/CustomLoading.dart';
import 'package:teste/modules/transferencia/components/ListaTransferecias.dart';
import 'package:teste/layout/ColorsTheme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TransferenciaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsTheme.blue,
        shape: CircleBorder(),
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Listatransferecias(),
    );
  }
}
