import 'dart:io';

import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class AppSettingsPage extends StatelessWidget {
  final themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          _listTile(
            context: context,
            text: 'Remover edições',
            trailing: Icon(Icons.arrow_forward, color: Theme.of(context).textTheme.bodyText1!.color),
            onTap: () => _dialog(context),
          ),
          _listTile(
            context: context,
            text: 'Dark mode',
            trailing: Switch(
              value: themeController.isDark,
              onChanged: (value) => themeController.setIsDark(value: value),
            ),
          ),
          _listTile(context: context, text: 'Enviar feedback', onTap: () => Modular.to.pushNamed('/feedback-form')),
          _listTile(
            context: context,
            text: 'Sobre o app',
            onTap: () => _launchUrl(),
          ),
        ],
      ),
    );
  }

  Widget _listTile({required BuildContext context, required String text, Widget? trailing, Function()? onTap}) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
          minVerticalPadding: 0,
          dense: true,
          trailing: trailing,
          title: Text(
            text,
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
        ),
        _customDivider(context, horizontalPadding: 16)
      ],
    );
  }

  Future _dialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            children: [
              simpleDialogOption(context: context, text: 'Nunca', onTap: () {}),
              _customDivider(context),
              simpleDialogOption(context: context, text: 'Manter 5 edições', onTap: () {}),
              _customDivider(context),
              simpleDialogOption(context: context, text: 'Manter 10 edições', onTap: () {}),
              _customDivider(context),
              simpleDialogOption(context: context, text: 'Manter 15 edições', onTap: () {}),
            ],
          );
        },
      );

  SimpleDialogOption simpleDialogOption({
    required BuildContext context,
    required String text,
    required Function() onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _customDivider(BuildContext context, {double? horizontalPadding}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
      color: Theme.of(context).dividerColor,
      height: 2,
    );
  }

  Future<void> _launchUrl() async {
    String url;
    if (Platform.isIOS) {
      url = 'https://www.apple.com/br/app-store/';
    } else {
      url = 'https://play.google.com/store/apps';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
