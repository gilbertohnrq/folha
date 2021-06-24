import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:dartz/dartz.dart';

abstract class NewsDetailsRepository{
  Future<Either<NewsDetailsFailures, BaseModel>> fetchNewsDetailsById(int id);
}