import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/domain/repository/news_repository_impl.dart';
import 'package:dartz/dartz.dart';

abstract class IFetchNewsUsecase {
  Future<Either<NewsFailures, BaseModel>> getUltimasNoticias();
  Future<Either<NewsFailures, BaseModel>> getEditoria(String editoria);
}

class FetchNewsUsecase implements IFetchNewsUsecase {
  final NewsRepository newsRepository;

  const FetchNewsUsecase(this.newsRepository);

  @override
  Future<Either<NewsFailures, BaseModel>> getUltimasNoticias() async {
    final response = await newsRepository.fetchAll();
    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<NewsFailures, BaseModel>> getEditoria(String editoria) async {
    final response = await newsRepository.fetchEditoria(editoria);
    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
