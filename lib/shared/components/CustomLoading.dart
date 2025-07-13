import 'package:flutter/material.dart';
import 'package:teste/layout/ColorsTheme.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: ColorsTheme.blue),
            SizedBox(height: 8),
            Text(
              'Carregando...',
              style: TextStyle(
                color: ColorsTheme.blue,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
