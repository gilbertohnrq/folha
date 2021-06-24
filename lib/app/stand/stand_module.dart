import 'package:app_client/app/stand/stand_Page.dart';
import 'package:app_client/app/stand/stand_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StandModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StandStore(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      transition: TransitionType.noTransition,
      child: (_, args) => const StandPage(),
    ),
  ];
}
