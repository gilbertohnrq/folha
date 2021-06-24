import 'package:app_client/app/news/presenter/widgets/last_news/last_news_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/cultura_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/economia_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/esporte_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/politica_store.dart';

class NewsController {
  final LastNewsStore lastNewsStore;
  final PoliticaStore politicaStore;
  final EsporteStore esporteStore;
  final EconomiaStore economiaStore;
  final CulturaStore culturaStore;

  NewsController(
      this.lastNewsStore,
      this.politicaStore,
      this.esporteStore,
      this.economiaStore,
      this.culturaStore,
      );

  Future<void> refreshLastNews() async {
    await lastNewsStore.fetchLastNews();
  }

  Future<void> refreshPolitica() async {
    await politicaStore.fetchPolitica();
  }

  Future<void> refreshEsporte() async {
    await esporteStore.fetchEsportes();
  }

  Future<void> refreshEconomia() async {
    await economiaStore.fetchEconomia();
  }

  Future<void> refreshCultura() async {
    await culturaStore.fetchCultura();
  }
}
