import 'package:flutter/material.dart';
import 'package:teste/layout/ColorsTheme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Transferências',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorsTheme.blue,
    );
  }
}
