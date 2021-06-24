import 'package:app_client/app/news/presenter/news_controller.dart';
import 'package:app_client/app/news/presenter/widgets/last_news/pageview_last_news.dart';
import 'package:app_client/app/news/presenter/widgets/news/pageview_news.dart';
import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class NewsPage extends StatelessWidget {
  final NewsController controller;
  final int initialIndex;

  const NewsPage({
    Key? key,
    required this.controller,
    this.initialIndex = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: initialIndex,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Theme.of(context).appBarTheme.titleTextStyle!.color,
            unselectedLabelColor: KonohaColors.branco_deactivate,
            tabs: const [
              Tab(text: 'Últimas notícias'),
              Tab(text: 'Política'),
              Tab(text: 'Economia'),
              Tab(text: 'Cultura'),
              Tab(text: 'Esporte'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                PageViewLastNews(controller: controller),
                PageViewNews(store: controller.politicaStore,onRefresh: controller.refreshPolitica),
                PageViewNews(store: controller.economiaStore,onRefresh: controller.refreshEconomia),
                PageViewNews(store: controller.culturaStore,onRefresh: controller.refreshCultura),
                PageViewNews(store: controller.esporteStore,onRefresh: controller.refreshEsporte),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
