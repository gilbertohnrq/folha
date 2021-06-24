import 'package:app_client/app/news_details/domain/entities/news_details_entity.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:app_client/app/news_details/domain/usecases/fetch_news_details_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class NewsDetailsStore extends NotifierStore<NewsDetailsFailures, NewsDetailsEntity> {
  final IFetchNewsDetailsUsecase fetchNewsDetailsUsecase;

  NewsDetailsStore(this.fetchNewsDetailsUsecase) : super(NewsDetailsEntity());

  Future<void> fetchNewsDetailsById(int id) async {
    setLoading(true);
    final response = await fetchNewsDetailsUsecase.getNewsDetailsById(id);
    response.fold(
      (l) => setError(l),
      (r) {
        // _baseModel = r;
        final NewsDetailsEntity news = r.resultado as NewsDetailsEntity;
        update(news);
      },
    );
    setLoading(false);
  }
}
