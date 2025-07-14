import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:get/get.dart';
import 'package:teste/shared/components/CustomInputSelect.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/shared/components/CustomButton.dart';
import 'package:teste/shared/components/CustomLoading.dart';
import 'package:teste/shared/components/CustomTextInput.dart';
import 'package:teste/modules/transferencia/controllers/TransferenciaController.dart';
import 'package:teste/shared/components/CustomToast.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  final TransferenciaController controller = Get.find();

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
                    suffixIcon: Icons.help,
                    keyboardType: TextInputType.number,
                    onSuffixTap: () => CustomToast(
                      title: 'CPF',
                      message: 'Digite seu CPF',
                      bgColor: ColorsTheme.green,
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  CustomTextInput(
                    controller: controller.numeroConta,
                    hint: '0000 0000 0000 0000',
                    label: 'Cartão',
                    suffixIcon: Icons.help,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.credit_card,
                    onSuffixTap: () => CustomToast(
                      title: 'Numero do cartao',
                      message: 'Digite seu CPF',
                      bgColor: ColorsTheme.green,
                    ),
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
                  CustomTextInput(
                    controller: controller.valorConta,
                    keyboardType: TextInputType.number,
                    label: 'Pesquisar',
                    hint: '0.00',
                    prefixIcon: Icons.search,
                  ),
                  Obx(() {
                    final selectedOption = controller.moedas.firstWhere(
                      (m) => m.value == controller.moeda.value,
                      orElse: () => controller.moedas[0],
                    );
                    return CustomInputSelect(
                      controller: controller.valorConta,
                      keyboardType: TextInputType.number,
                      label: 'Moeda',
                      hint: '',
                      onChanged: (value) {
                        controller.moeda.value = value;
                      },
                      prefixIcon: Icons.search,
                      options: controller.moedas,
                      value: controller.moeda.value,
                    );
                  }),
                  CustomButton(
                    backgroundColor: ColorsTheme.blue,
                    onPressed: () => controller.make(),
                    label: 'Criar',
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
