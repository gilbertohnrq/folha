import 'package:app_client/app/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

import 'package:app_client/app/core/service/theme/theme_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController splashController;
  final ThemeController themeController;

  const SplashPage({Key? key, required this.splashController, required this.themeController}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: KonohaLogoAnimated(
          onFinished: () async {
            await Future.delayed(const Duration(milliseconds: 200));
            await widget.splashController.checkFirstSeen();
          },
          isDarkMode: widget.themeController.isDark,
        ),
      ),
    );
  }
}
