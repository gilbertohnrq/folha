import 'package:app_client/app/core/models/pagination.dart';

class BaseModel {
  bool? status;
  String? mensagem;
  Pagination? pagination;
  dynamic resultado;


  BaseModel({this.status, this.mensagem, this.resultado, this.pagination});

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      status: map['status'] as bool?,
      mensagem: map['mensagem'] as String?,
      pagination: map['paginacao'] != null ? Pagination.fromJson(map['paginacao']) : null,
      resultado: map['resultado'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'mensagem': mensagem,
      'pagination': pagination,
      'resultado': resultado,
    };
  }
}