import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:get/get.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/shared/components/CustomLoading.dart';
import 'package:teste/shared/components/CustomTextInput.dart';
import 'package:teste/modules/transferencia/controllers/CreateController.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  final CreateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isLoading.value) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextInput(
                    controller: controller.numeroConta,
                    hint: '0000',
                    label: 'Número da conta',
                    keyboardType: TextInputType.number,
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  CustomTextInput(
                    controller: controller.valorConta,
                    keyboardType: TextInputType.number,
                    label: 'Valor',
                    hint: '0.00',
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    prefixIcon: Icons.monetization_on,
                    inputFormatters: [
                      CurrencyInputFormatter(
                        leadingSymbol: 'R\$',
                        useSymbolPadding: true,
                        thousandSeparator: ThousandSeparator.Period,
                        mantissaLength: 2,
                        trailingSymbol: '',
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => controller.criar(),
                    child: Text("Clique aqui"),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return CustomLoading();
      }
    });
  }
}
