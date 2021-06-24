import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouterInterceptor extends Interceptor {
  @override
  // ignore: avoid_void_async
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      final responseIsList = response.data is! List;
      if (responseIsList) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('route')) {
          await Modular.to.pushReplacementNamed("${response.data['route']}");
        }
        super.onResponse(response, handler);
      }
    } catch (e, h) {
      onError(e as DioError, h as ErrorInterceptorHandler);
    } finally {
      super.onResponse(response, handler);
    }
  }
}
