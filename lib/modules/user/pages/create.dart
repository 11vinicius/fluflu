import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/user/controllers/UserController.dart';
import 'package:teste/shared/components/CustomAppBar.dart';
import 'package:teste/shared/components/CustomButton.dart';
import 'package:teste/shared/components/CustomTextInput.dart';
import 'package:teste/shared/components/CustomToast.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Usuário'),
      body: Column(
        children: [
          CustomTextInput(
            enable: !controller.isLoading.value,
            controller: controller.name,
            label: 'Nome',
            hint: 'Nome',
          ),
          CustomTextInput(
            enable: !controller.isLoading.value,
            controller: controller.email,
            label: 'E-mail',
            hint: 'E-mail',
          ),
          CustomTextInput(
            controller: controller.password,
            obscureText: true,
            hint: 'Password',
            label: 'Passwors',
            suffixIcon: Icons.help,
            enable: !controller.isLoading.value,
            keyboardType: TextInputType.number,
            onSuffixTap: () => CustomToast(
              title: 'Aviso!',
              message:
                  'A Senha deve conter ao menos uma letra maiúscula e um caractere especial.',
              bgColor: ColorsTheme.green,
            ),
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),

          CustomButton(
            onPressed: () => controller.save(),
            backgroundColor: ColorsTheme.blue,
            label: 'Salvar',
            isLoading: !controller.isLoading.value,
          ),
        ],
      ),
    );
  }
}
