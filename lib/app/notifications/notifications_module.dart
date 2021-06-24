import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/notifications/notifications_Page.dart';
import 'package:app_client/app/notifications/notifications_controller.dart';
import 'package:app_client/app/notifications/notifications_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificationsModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotificationsStore()),
    Bind((i) => NotificationsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NotificationsPage()),
  ];
}
