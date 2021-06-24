import 'package:app_client/app/news/domain/usecases/fetch_news_usecase.dart';
import 'package:app_client/app/news/external/datasource/news_datasource_impl.dart';
import 'package:app_client/app/news/infra/repositories/news_repository_impl.dart';
import 'package:app_client/app/news/presenter/news_controller.dart';
import 'package:app_client/app/news/presenter/news_page.dart';
import 'package:app_client/app/news/presenter/widgets/last_news/last_news_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/cultura_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/economia_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/esporte_store.dart';
import 'package:app_client/app/news/presenter/widgets/news/politica_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsModule extends Module {
  @override
  final List<Bind> binds = [
    ///Stores
    Bind((i) => LastNewsStore(i()), export: true),
    Bind.lazySingleton((i) => PoliticaStore(i()), export: true),
    Bind.lazySingleton((i) => EsporteStore(i()), export: true),
    Bind.lazySingleton((i) => EconomiaStore(i()), export: true),
    Bind.lazySingleton((i) => CulturaStore(i()), export: true),

    Bind.lazySingleton((i) => FetchNewsUsecase(i()), export: true),
    Bind.lazySingleton((i) => NewsRepositoryImpl(i()), export: true),
    Bind.lazySingleton((i) => NewsDatasourceImpl(i()), export: true),

    ///Controller
    Bind((i) => NewsController(i(),i(), i(), i(),i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:id',
      transition: TransitionType.noTransition,
      child: (_, args) => NewsPage(
        controller: Modular.get<NewsController>(),
        initialIndex: int.tryParse(args.params['id'] as String? ?? '0') ?? 0,
      ),
    ),
  ];
}
