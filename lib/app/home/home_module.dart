import 'package:app_client/app/columnist/columnist_module.dart';
import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:app_client/app/home/home_controller.dart';
import 'package:app_client/app/home/presenter/home_page.dart';
import 'package:app_client/app/news/news_module.dart';
import 'package:app_client/app/stand/stand_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    StandModule(),
    NewsModule(),
    ColumnistModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(
        homeController: Modular.get<HomeController>(),
        themeController: Modular.get<ThemeController>(),
      ),
      children: [
        ModuleRoute('/news', module: NewsModule()),
        ModuleRoute('/stand', module: StandModule()),
        ModuleRoute('/columnist', module: ColumnistModule()),
      ],
    ),
  ];
}
