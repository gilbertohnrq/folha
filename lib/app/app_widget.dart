import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: KonohaTheme.lightTheme,
          darkTheme: KonohaTheme.darkTheme,
          themeMode: Modular.get<ThemeController>().isDark ? ThemeMode.dark : ThemeMode.light,
          title: 'Folha de Pernambuco',
        ).modular();
      },
    );
  }
}
