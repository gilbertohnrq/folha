import 'package:app_client/app/notifications/notifications_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_client/app/notifications/notifications_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class NotificationsPage extends StatefulWidget {
  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  final NotificationsStore store = Modular.get();
  final NotificationsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: RxBuilder(builder: (context) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 36, bottom: 56),
              child: Text(
                'Receba notificações de acordo com seus temas de preferências',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text('Últimas notícias', style: Theme.of(context).textTheme.headline4),
              trailing: Switch(
                onChanged: (value) => controller.setLastNews(value: value),
                value: controller.lastNewsValue,
              ),
            ),
            ListTile(
              title: Text('Política', style: Theme.of(context).textTheme.headline4),
              trailing: Switch(
                onChanged: (value) => controller.setPolitics(value: value),
                value: controller.politicsValue,
              ),
            ),
            ListTile(
              title: Text('Economia', style: Theme.of(context).textTheme.headline4),
              trailing: Switch(
                onChanged: (value) => controller.setEconomy(value: value),
                value: controller.economyValue,
              ),
            ),
            ListTile(
              title: Text('Cultura', style: Theme.of(context).textTheme.headline4),
              trailing: Switch(
                onChanged: (value) => controller.setCulture(value: value),
                value: controller.cultureValue,
              ),
            ),
            ListTile(
              title: Text('Esportes', style: Theme.of(context).textTheme.headline4),
              trailing: Switch(
                onChanged: (value) => controller.setSports(value: value),
                value: controller.sportsValue,
              ),
            ),
          ],
        );
      }),
    );
  }
}
