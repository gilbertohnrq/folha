import 'package:app_client/app/core/helpers/date_helper.dart';
import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/presenter/widgets/main_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class PageViewNews extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Store<NewsFailures, List<NewsEntity>> store;

  const PageViewNews({Key? key, required this.store,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<Store<NewsFailures, List<NewsEntity>>, NewsFailures, List<NewsEntity>>(
      store: store,
      onError: (context, error) => const Center(child: Text('erro')),
      onLoading: (context) => ListView(children: List.generate(10, (index) => const MainCardShimmer())),
      onState: (context,List<NewsEntity> state) => KonohaListViewBuilder(
        scrollController: ScrollController(),
        onRefresh: onRefresh,
        list: state,
        itemBuilder: (context, index) {
          final news = state[index];
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
                Modular.to.pushNamed('../../news-details',arguments: news);
              },
            ),
          );
        },
      ),
    );
  }
}
