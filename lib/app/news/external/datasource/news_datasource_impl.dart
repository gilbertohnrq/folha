import 'package:app_client/app/core/constants/endpoints/endpoint.dart';
import 'package:app_client/app/core/models/base_model.dart';
import 'package:app_client/app/core/service/http/http_service.dart';
import 'package:app_client/app/news/domain/errors/failures/news_failures.dart';
import 'package:app_client/app/news/external/adapters/news_adapter.dart';
import 'package:app_client/app/news/infra/datasources/news_datasource.dart';

class NewsDatasourceImpl implements INewsDatasource {
  final IHttpService httpService;

  NewsDatasourceImpl(this.httpService);

  @override
  Future<BaseModel> fetchAll() async {
    try {
      final result = await httpService.get(Endpoints.noticias);
      final BaseModel baseModel = BaseModel.fromMap(result.data as Map<String, dynamic>);
      baseModel.resultado = (baseModel.resultado as List).map((e) => NewsAdapter.fromJson(e)).toList();
      return baseModel;
    } catch (e) {
      throw DataSourceFailure(e.toString());
    }
  }

  @override
  Future<BaseModel> fetchEditoria(String editoria) async {
    try {
      final param = {'editoria': editoria};
      final result = await httpService.get(Endpoints.noticias, queryParameters: param);
      final BaseModel baseModel = BaseModel.fromMap(result.data as Map<String, dynamic>);
      baseModel.resultado = (baseModel.resultado as List).map((e) => NewsAdapter.fromJson(e)).toList();
      return baseModel;
    } catch (e) {
      throw DataSourceFailure(e.toString());
    }
  }
}
