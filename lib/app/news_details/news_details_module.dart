import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/news_details/domain/usecases/fetch_news_details_usecase.dart';
import 'package:app_client/app/news_details/external/datasource/news_datasource_impl.dart';
import 'package:app_client/app/news_details/infra/repositories/news_repository_impl.dart';
import 'package:app_client/app/news_details/news_details_page.dart';
import 'package:app_client/app/news_details/news_details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsDetailsModule extends Module {

  @override
  final List<Module> imports = [
    CoreModule(),
  ];
  
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NewsDetailsStore(i())),
    Bind.lazySingleton((i) => FetchNewsDetailsUsecase(i()), export: true),
    Bind.lazySingleton((i) => NewsDetailsRepositoryImpl(i()), export: true),
    Bind.lazySingleton((i) => NewsDetailsDatasourceImpl(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id', child: (_, args) => NewsDetailsPage(id: int.tryParse(args.params['id'] as String? ?? '0') ?? 0,
    newsDetailsStore: Modular.get<NewsDetailsStore>()),
    ),
  ];
}
