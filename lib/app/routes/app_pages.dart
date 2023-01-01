import 'package:get/get.dart';
import 'package:rushd/app/modules/login/views/splash_view.dart';

import '../modules/audiobook/views/audiobook_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const intial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.audioBook,
      page: () => AudiobookView(),
    ),
    GetPage(
        name: _Paths.currentAudioBook,
        page: () => AudiobookView(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 350)),
    GetPage(
      name: _Paths.login,
      page: () => const SplashView(),
      binding: LoginBinding(),
    ),
  ];
}
