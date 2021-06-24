import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:app_client/app/drawer/drawer_controller.dart';
import 'package:app_client/app/drawer/widget/drawer_listile.dart';
import 'package:app_client/app/drawer/widget/drawer_listile_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:konoha/konoha.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              color: _themeController.isDark == true ? KonohaColors.cinza_total : KonohaColors.cinza_header,
              width: double.infinity,
              height: 160,
              child: Center(child: _themeController.isDark == true ? KonohaImages.logoComBordaDark() : KonohaImages.logoComBorda()),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerListTile(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      text: 'Últimas notícias',
                      ontap: Modular.get<CustomDrawerController>().ultimasNoticias,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Política',
                      ontap: Modular.get<CustomDrawerController>().politica,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Economia',
                      ontap: Modular.get<CustomDrawerController>().economia,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Cultura',
                      ontap: Modular.get<CustomDrawerController>().cultura,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Esportes',
                      ontap: Modular.get<CustomDrawerController>().esportes,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      text: 'Edição Digital',
                      ontap: () {},
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Meus jornais',
                      ontap: Modular.get<CustomDrawerController>().myJournals,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      text: 'Notificações',
                      ontap: () {},
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Configurações',
                      ontap: Modular.get<CustomDrawerController>().settings,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      text: 'Fale com a gente',
                      ontap: Modular.get<CustomDrawerController>().feedbackForm,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      text: 'Rádio',
                      ontap: () {},
                    ),
                    DrawerListTileIcon(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      icon: KonohaIcons.facebook_menu,
                      text: 'Facebook',
                      ontap: Modular.get<CustomDrawerController>().launchURLFacebook,
                    ),
                    DrawerListTileIcon(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      icon: KonohaIcons.twitter,
                      text: 'Twitter',
                      ontap: Modular.get<CustomDrawerController>().launchURLTwitter,
                    ),
                    DrawerListTileIcon(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      icon: KonohaIcons.instagram,
                      text: 'Instagram',
                      ontap: Modular.get<CustomDrawerController>().launchURLInstagram,
                    ),
                    DrawerListTileIcon(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      icon: KonohaIcons.youtube,
                      text: 'Youtube',
                      ontap: Modular.get<CustomDrawerController>().launchURLYoutube,
                    ),
                    DrawerListTileIcon(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      icon: KonohaIcons.whatsapp,
                      text: 'Whatsapp',
                      ontap: Modular.get<CustomDrawerController>().launchURLWhatsapp,
                    ),
                    DrawerListTile(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      text: 'Termos de uso',
                      ontap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
