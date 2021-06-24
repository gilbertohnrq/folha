import 'package:app_client/app/core/constants/endpoints/endpoint.dart';
import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/core/service/http/http_service.dart';
import 'package:app_client/app/news_details/domain/errors/failures/news_details_failures.dart';
import 'package:app_client/app/news_details/external/adapters/news_details_adapter.dart';
import 'package:app_client/app/news_details/infra/datasources/news_datasource.dart';

class NewsDetailsDatasourceImpl implements INewsDetailsDatasource {
  final IHttpService httpService;

  NewsDetailsDatasourceImpl(this.httpService);

  @override
  Future<BaseModel> fetchNewsDetailsById(int id) async {
    final String newsId = id.toString();
    try {
      final result = await httpService.get('${Endpoints.noticias}/$newsId');
      final BaseModel baseModel = BaseModel.fromMap(result.data as Map<String, dynamic>);
      baseModel.resultado = NewsDetailsAdapter.fromJson(baseModel.resultado);
      return baseModel;
    } catch (e) {
      throw DataSourceFailure(e.toString());
    }
  }
}
