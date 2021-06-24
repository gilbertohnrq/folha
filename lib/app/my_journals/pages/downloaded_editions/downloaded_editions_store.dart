import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DownloadedEditionsStore extends NotifierStore<NewsFailures, List<NewsEntity>> {
  DownloadedEditionsStore() : super([]) {
    fetch();
  }

  // late final BaseModel _baseModel;

  Future<void> fetch() async {
    setLoading(true);
    // final response = await fetchNewsUsecase.getEditoria('cultura');
    await Future.delayed(const Duration(seconds: 3));
    final response = List.generate(12, (index) => NewsEntity(idDnNoticia: index));

    // response.fold(initialValue, (previousValue, element) => null);

    update(response);

    // (l) => setError(DataSourceFailure('error')),
    //   (r) {
    //     // _baseModel = r;
    //     List<NewsEntity> _list = [];
    //     if (r.resultado is List<NewsEntity>) {
    //       _list = r.resultado as List<NewsEntity>;
    //     }
    //     update(_list);
    //   },
    setLoading(false);
  }
}
