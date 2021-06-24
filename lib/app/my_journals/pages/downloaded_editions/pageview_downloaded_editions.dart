import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_controller.dart';
import 'package:app_client/app/my_journals/pages/downloaded_editions/downloaded_editions_store.dart';
import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class PageviewDownloadedEditions extends StatelessWidget {
  final DownloadedEditionsStore downloadedEditionsStore;
  final DownloadedEditionsController downloadedEditionsController;

  const PageviewDownloadedEditions({
    Key? key,
    required this.downloadedEditionsStore,
    required this.downloadedEditionsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<DownloadedEditionsStore, NewsFailures, List<NewsEntity>>(
      store: downloadedEditionsStore,
      onLoading: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (context, error) => const Center(child: Text('ERRO')),
      onState: (context, state) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 42),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Wrap(
              spacing: MediaQuery.of(context).size.width * 0.08,
              runSpacing: 22,
              children: List.generate(
                state.length,
                (index) => KonohaCardDiaDaSemana(
                  cardCallback: () {},
                  shareCallBack: () {},
                  imageUrl: 'https://cdn.vercapas.com.br/covers/folha-de-pernambuco/2020/capa-jornal-folha-de-pernambuco-22-01-2020-c85.jpg',
                  weekDay: 'Dia da semana',
                  monthDay: '00 de mês',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
