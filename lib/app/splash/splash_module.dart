import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/core/service/theme/theme_controller.dart' show ThemeController;
import 'package:app_client/app/splash/splash_controller.dart';
import 'package:app_client/app/splash/splash_page.dart';
import 'package:app_client/app/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
    Bind((i) => SplashController(localStorage: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => SplashPage(
        splashController: Modular.get<SplashController>(),
        themeController: Modular.get<ThemeController>(),
      ),
    ),
  ];
}
