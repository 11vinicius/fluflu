import 'package:flutter/material.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class CustomFloatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CustomFloatButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsTheme.blue,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
