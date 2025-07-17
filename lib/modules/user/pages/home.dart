import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/shared/components/CustomDrawer.dart';
import 'package:teste/shared/components/CustomFloatButton.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TransferenciaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showMenu: true, title: 'Usuário'),
      drawer: CustomDrawer(),
      body: Text('User'),
      floatingActionButton: CustomFloatButton(
        onPressed: () => Navigator.pushNamed(context, '/user/create'),
        icon: Icons.add,
      ),
    );
  }
}
