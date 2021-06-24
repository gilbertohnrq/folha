import 'package:app_client/app/app_module.dart';
import 'package:app_client/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appModule = AppModule();
  Modular.init(appModule);
  await appModule.isReady();

  runApp(
    ModularApp(
      module: appModule,
      notAllowedParentBinds: true,
      child: AppWidget(),
    ),
  );
}
