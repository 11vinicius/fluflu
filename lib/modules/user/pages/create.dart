import 'package:flutter/material.dart';
import 'package:teste/shared/components/CustomAppBar.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Usuário'),
      body: Column(children: []),
    );
  }
}
