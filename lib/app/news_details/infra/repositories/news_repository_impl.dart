import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:app_client/app/news_details/domain/repository/news_repository_impl.dart';
import 'package:app_client/app/news_details/infra/datasources/news_datasource.dart';
import 'package:dartz/dartz.dart';

class NewsDetailsRepositoryImpl implements NewsDetailsRepository {
  final INewsDetailsDatasource datasource;

  NewsDetailsRepositoryImpl(this.datasource);

  @override
  Future<Either<NewsDetailsFailures, BaseModel>> fetchNewsDetailsById(int id) async{
    try {
      final response = await datasource.fetchNewsDetailsById(id);
      return Right(response);
    } on NewsDetailsFailures catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceFailure(e.toString()));
    }

  }
}
