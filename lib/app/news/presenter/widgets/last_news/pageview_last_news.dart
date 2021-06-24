import 'package:app_client/app/core/components/widgets/error_screen_state.dart';
import 'package:app_client/app/core/helpers/date_helper.dart';
import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/presenter/news_controller.dart';
import 'package:app_client/app/news/presenter/widgets/last_news/last_news_store.dart';
import 'package:app_client/app/news/presenter/widgets/main_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class PageViewLastNews extends StatelessWidget {
  final NewsController controller;

  const PageViewLastNews({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<LastNewsStore, NewsFailures, List<NewsEntity>>(
      store: controller.lastNewsStore,
      onError: (context, error) => const ErrorScreenState(),
      onLoading: (context) => ListView(children: List.generate(10, (index) => const MainCardShimmer())),
      onState: (context, state) => KonohaListViewBuilder(
        scrollController: ScrollController(),
        onRefresh: controller.refreshLastNews,
        list: state,
        itemBuilder: (context, index) {
          final news = state[index];
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: KonohaCardNoticiaPrincipal(
                tituloNoticica: news.titulo!,
                imageUrl: 'https://image.freepik.com/fotos-gratis/maquina-de-escrever-vintage-em-mesa-de-madeira_1150-1807.jpg',
                dataHora: DateHelper.formatDateNoticiaPrincipal(news.dataNoticia!),
                iconBookMark: Icons.bookmark_border,
                bookmarkCallBack: () {},
                shareCallBack: () {},
                noticiaCallBack: () {
                  Modular.to.pushNamed('../../news-details/${news.idDnNoticia}');
                },
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: KonohaCardNoticiaSecundaria(
                tema: news.editoria!,
                tituloNoticia: news.titulo!,
                imageUrl: 'https://image.freepik.com/fotos-gratis/maquina-de-escrever-vintage-em-mesa-de-madeira_1150-1807.jpg',
                dataHora: DateHelper.formatDateManyHoursAgo(news.dataNoticia!),
                iconBookMark: Icons.bookmark_border,
                bookmarkCallBack: () {},
                shareCallBack: () {},
                noticiaCallBack: () {
                  Modular.to.pushNamed('../../news-details/${news.idDnNoticia}');
                },
              ),
            );
          }
        },
      ),
    );
  }
}
