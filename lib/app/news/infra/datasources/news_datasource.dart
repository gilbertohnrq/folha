import 'package:app_client/app/core/models/base_model.dart';

abstract class INewsDatasource {
  Future<BaseModel> fetchAll();
  Future<BaseModel> fetchEditoria(String editoria);
}
