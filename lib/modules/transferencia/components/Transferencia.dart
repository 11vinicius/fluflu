import 'package:flutter/material.dart';
import 'package:teste/modules/transferencia/models/TransfereciaModel.dart';

class Transferencia extends StatelessWidget {
  final TransfereciaModel transferencia;

  Transferencia({required this.transferencia});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.numeroConta.toString()),
        subtitle: Text('R\$${transferencia.valor.toString()}'),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {},
        ),
      ),
    );
  }
}
