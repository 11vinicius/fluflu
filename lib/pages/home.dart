import 'package:flutter/material.dart';
import 'package:teste/components/CustomAppBar.dart';
import 'package:teste/components/ListaTransferecias.dart';
import 'package:teste/layout/ColorsTheme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
