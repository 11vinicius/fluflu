import 'package:get/get.dart';
import 'package:teste/modules/transferencia/TransferenciaBinding.dart';
import 'package:teste/modules/transferencia/pages/create.dart';
import 'package:teste/modules/transferencia/pages/home.dart';

final List<GetPage> TransferenciaRoutes = [
  GetPage(
    name: '/transferencia/home',
    page: () => HomePage(),
    transition: Transition.fadeIn,
    binding: TransferenciaBinding(),
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: '/transferencia/create',
    page: () => CreatePage(),
    transition: Transition.fadeIn,
    binding: TransferenciaBinding(),
    transitionDuration: Duration(milliseconds: 400),
  ),
];
