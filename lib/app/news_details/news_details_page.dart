import 'package:app_client/app/core/components/widgets/error_screen_state.dart';
import 'package:app_client/app/core/helpers/date_helper.dart';
import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:app_client/app/news_details/domain/entities/news_details_entity.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:app_client/app/news_details/news_details_store.dart';
import 'package:app_client/app/news_details/widgets/details_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class NewsDetailsPage extends StatefulWidget {
  final int id;
  final NewsDetailsStore newsDetailsStore;

  const NewsDetailsPage({Key? key, required this.id, required this.newsDetailsStore}) : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  void initState() {
    widget.newsDetailsStore.fetchNewsDetailsById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Modular.get<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: RxBuilder(
          builder: (context) {
            return KonohaImages.logo(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.3611,
              color: themeController.isDark ? KonohaColors.branco : null,
            );
          },
        ),
        centerTitle: true,
      ),
      body: ScopedBuilder<NewsDetailsStore, NewsDetailsFailures, NewsDetailsEntity>(
        store: widget.newsDetailsStore,
        onLoading: (context) => const DetailsCardShimmer(),
        onError: (context, error) => const ErrorScreenState(),
        onState: (context, news) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.titulo!,
                style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                'Publicado por ${news.autor!}',
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                DateHelper.formatDateNewsDetail(news.dataNoticia!),
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w400),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 25),
                child: PhysicalModel(
                  elevation: 6,
                  color: KonohaColors.botao_apple,
                  child: KonohaCacheNetworkImage(
                    width: double.infinity,
                    height: 180,
                    imageUrl: 'https://emc.acidadeon.com/dbimagens/jornal_a_790x505_29102018222427.jpg',
                  ),
                ),
              ),
              Text(
                news.subtitulo!,
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              Html(
                data: news.texto!.replaceAll('@@NOTICIAS_RELACIONADAS@@', ''),
                style: {
                  'p': Style(color: Theme.of(context).textTheme.bodyText1!.color),
                  'strong': Style(fontWeight: FontWeight.bold),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
