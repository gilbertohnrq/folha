import 'package:app_client/app/news/domain/entities/news_entity.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/domain/usecases/fetch_news_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class EconomiaStore extends NotifierStore<NewsFailures, List<NewsEntity>> {
  final IFetchNewsUsecase fetchNewsUsecase;

  EconomiaStore(this.fetchNewsUsecase) : super([]) {
    fetchEconomia();
  }

  // late final BaseModel _baseModel;

  Future<void> fetchEconomia() async {
    setLoading(true);
    final response = await fetchNewsUsecase.getEditoria('economia');
     response.fold(
      (l) => setError(l),
      (r) {
        // _baseModel = r;
        List<NewsEntity> _list = [];
        if (r.resultado is List<NewsEntity>) {
          _list = r.resultado as List<NewsEntity>;
        }
        update(_list);
      },
    );
    setLoading(false);
  }
}
