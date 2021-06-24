import 'package:app_client/app/columnist/columnist_details/columnist_details_page.dart';
import 'package:app_client/app/columnist/columnist_details/columnist_details_store.dart';
import 'package:app_client/app/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ColumnistDetailsModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ColumnistDetailsStore(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ColumnistDetailsPage()),
  ];
}
