import 'package:get/get.dart';
import 'package:teste/modules/user/UserBinding.dart';
import 'package:teste/modules/user/pages/create.dart';
import 'package:teste/modules/user/pages/home.dart';

final List<GetPage> UserRoutes = [
  GetPage(
    name: '/user/home',
    page: () => HomePage(),
    transition: Transition.fadeIn,
    binding: UserBinding(),
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: '/user/create',
    page: () => CreatePage(),
    transition: Transition.fadeIn,
    binding: UserBinding(),
    transitionDuration: Duration(milliseconds: 400),
  ),
];
