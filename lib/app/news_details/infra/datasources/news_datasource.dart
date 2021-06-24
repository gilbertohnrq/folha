import 'package:app_client/app/core/models/base_model.dart';

abstract class INewsDetailsDatasource {
  Future<BaseModel> fetchNewsDetailsById(int id);
}
