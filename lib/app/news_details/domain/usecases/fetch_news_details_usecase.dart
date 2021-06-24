import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:app_client/app/news_details/domain/repository/news_repository_impl.dart';
import 'package:dartz/dartz.dart';

abstract class IFetchNewsDetailsUsecase {
  Future<Either<NewsDetailsFailures, BaseModel>> getNewsDetailsById(int id);
}

class FetchNewsDetailsUsecase implements IFetchNewsDetailsUsecase {
  final NewsDetailsRepository newsRepository;

  const FetchNewsDetailsUsecase(this.newsRepository);

  @override
  Future<Either<NewsDetailsFailures, BaseModel>> getNewsDetailsById(int id) async {
    final response = await newsRepository.fetchNewsDetailsById(id);
    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
