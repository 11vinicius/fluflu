import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Drawer(
      child: Column(
        children: [
          // Header com padding no topo
          Container(
            padding: EdgeInsets.only(
              top: statusBarHeight + 8, // 👈 padding top responsivo
              left: 16,
              right: 16,
            ),
            width: double.infinity,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Get.back(); // Fecha o Drawer
                  },
                ),
              ],
            ),
          ),
          // Itens do menu
          Expanded(
            child: ListView(
              padding:
                  EdgeInsets.zero, // 👈 Remove o espaço entre header e menu
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Transferencia'),
                  onTap: () {
                    Get.toNamed('/transferencia/home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Usuário'),
                  onTap: () {
                    Get.toNamed('/user/home');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
