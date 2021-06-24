import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/my_journals/my_journals_page.dart';
import 'package:app_client/app/my_journals/my_journals_store.dart';
import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_controller.dart';
import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_store.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_controller.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyJournalsModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MyJournalsStore()),
    Bind.lazySingleton((i) => DownloadedEditionsStore()),
    Bind.lazySingleton((i) => SavedArticlesStore()),
    Bind((i) => SavedArticlesController()),
    Bind((i) => DownloadedEditionsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MyJournalsPage()),
  ];
}
