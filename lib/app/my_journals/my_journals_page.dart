import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_controller.dart';
import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_store.dart';
import 'package:app_client/app/my_journals/pages/downloaded_editions/pageview_downloaded_editions.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/pageview_saved_articles.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_controller.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_client/app/my_journals/my_journals_store.dart';
import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class MyJournalsPage extends StatefulWidget {
  const MyJournalsPage();

  @override
  MyJournalsPageState createState() => MyJournalsPageState();
}

class MyJournalsPageState extends State<MyJournalsPage> {
  final MyJournalsStore store = Modular.get();
  final SavedArticlesController savedArticlesController = Modular.get();
  final SavedArticlesStore savedArticlesStore = Modular.get();
  final DownloadedEditionsController downloadedEditionsController = Modular.get();
  final DownloadedEditionsStore downloadedEditionsStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus jornais'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Theme.of(context).appBarTheme.titleTextStyle!.color,
              unselectedLabelColor: KonohaColors.branco_deactivate,
              tabs: [
                Tab(
                  child: Text(
                    'Edições baixadas',
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    'Matérias salvas',
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PageviewDownloadedEditions(
                    downloadedEditionsController: downloadedEditionsController,
                    downloadedEditionsStore: downloadedEditionsStore,
                  ),
                  PageviewSavedArticles(
                    savedArticlesStore: savedArticlesStore,
                    savedArticlesController: savedArticlesController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
