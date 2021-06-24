import 'package:app_client/app/app_settings/app_settings_page.dart';
import 'package:app_client/app/app_settings/app_settings_store.dart';
import 'package:app_client/app/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppSettingsModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppSettingsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AppSettingsPage()),
  ];
}
