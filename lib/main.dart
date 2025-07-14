import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/modules/transferencia/bindings/TransferenciaBinding.dart';
import 'package:teste/modules/transferencia/pages/create.dart';
import 'package:teste/modules/transferencia/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: TransferenciaBinding(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 400),
        ),
        GetPage(
          name: '/create',
          page: () => CreatePage(),
          binding: TransferenciaBinding(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 400),
        ),
      ],
    );
  }
}
