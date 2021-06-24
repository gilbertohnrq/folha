import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:app_client/app/drawer/drawer_page.dart';
import 'package:app_client/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  final ThemeController themeController;
  final HomeController homeController;

  const HomePage({Key? key, required this.themeController, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        elevation: 20,
        shadowColor: const Color.fromRGBO(0, 0, 0, .5),
        title: RxBuilder(
          builder: (context) {
            return KonohaImages.logo(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.3611,
              color: themeController.isDark ? KonohaColors.branco : null,
            );
          },
        ),
        centerTitle: true,
        actions: [
          RxBuilder(
            builder: (_) {
              return Switch(
                value: themeController.isDark,
                onChanged: (value) => themeController.setIsDark(value: value),
              );
            },
          ),
        ],
      ),
      body: RouterOutlet(),
      bottomNavigationBar: RxBuilder(
        builder: (context) => BottomNavigationBar(
          currentIndex: homeController.bottomTabSelected,
          backgroundColor: Theme.of(context).appBarTheme.color,
          selectedLabelStyle: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w700, height: 1.7),
          unselectedLabelStyle: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
          unselectedItemColor: themeController.isDark ? KonohaColors.branco : KonohaColors.branco_deactivate,
          onTap: homeController.setBottomTabSelectedAndNavigate,
          iconSize: 20,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(KonohaIcons.home),
              label: 'Notícicas',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: 1.25,
                child: const Icon(MdiIcons.bookOpenOutline),
              ),
              label: 'Banca',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(scale: 2, child: const Icon(MdiIcons.formatQuoteClose)),
              label: 'Colunista',
            ),
          ],
        ),
      ),
    );
  }
}
