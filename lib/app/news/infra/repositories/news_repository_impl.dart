import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/domain/repository/news_repository_impl.dart';
import 'package:app_client/app/news/infra/datasources/news_datasource.dart';
import 'package:dartz/dartz.dart';

class NewsRepositoryImpl implements NewsRepository {
  final INewsDatasource datasource;

  NewsRepositoryImpl(this.datasource);

  @override
  Future<Either<NewsFailures, BaseModel>> fetchAll() async {
    try {
      final response = await datasource.fetchAll();
      return Right(response);
    } on NewsFailures catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceFailure(e.toString()));
    }
  }

  @override
  Future<Either<NewsFailures, BaseModel>> fetchEditoria(String editoria) async {
    try {
      final response = await datasource.fetchEditoria(editoria);
      return Right(response);
    } on NewsFailures catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceFailure(e.toString()));
    }
  }
}
