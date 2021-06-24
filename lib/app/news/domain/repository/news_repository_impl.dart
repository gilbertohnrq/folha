import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository{
  Future<Either<NewsFailures, BaseModel>> fetchAll();
  Future<Either<NewsFailures, BaseModel>> fetchEditoria(String editoria);
}