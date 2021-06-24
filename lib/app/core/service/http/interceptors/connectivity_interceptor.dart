import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptor extends Interceptor {
  @override
  // ignore: avoid_void_async
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioError(type: DioErrorType.connectTimeout, requestOptions: options);
    }
    return super.onRequest(options, handler);
  }
}
