import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_controller.dart';
import 'package:app_client/app/my_journals/pages/saved_articles/saved_articles_store.dart';
import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';

class PageviewSavedArticles extends StatelessWidget {
  final SavedArticlesStore savedArticlesStore;
  final SavedArticlesController savedArticlesController;

  const PageviewSavedArticles({
    Key? key,
    required this.savedArticlesStore,
    required this.savedArticlesController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<SavedArticlesStore, NewsFailures, List<NewsEntity>>(
      store: savedArticlesStore,
      onLoading: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (context, error) => const Center(child: Text('ERRO')),
      onState: (context, state) => Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
        ),
        child: KonohaListViewBuilder(
          scrollController: ScrollController(),
          onRefresh: () async {},
          list: state,
          itemBuilder: (context, index) => KonohaCardNoticiaSecundaria(
            tema: 'TESTE',
            tituloNoticia: 'Congresso derruba veto a PL que garante acesso à internet a alunos',
            imageUrl: 'https://image.freepik.com/fotos-gratis/maquina-de-escrever-vintage-em-mesa-de-madeira_1150-1807.jpg',
            dataHora: '2021-06-01 22:08:00',
            iconBookMark: Icons.bookmark_border,
            bookmarkCallBack: () => savedArticlesController.removeArticleDialog(context, () => null),
            shareCallBack: () {},
            noticiaCallBack: () {},
          ),
        ),
      ),
    );
  }
}
