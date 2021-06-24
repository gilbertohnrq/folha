import 'package:app_client/app/columnist/columnist_Page.dart';
import 'package:app_client/app/columnist/columnist_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ColumnistModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ColumnistStore(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      transition: TransitionType.noTransition,
      child: (_, args) => ColumnistPage(),
    ),
  ];
}
