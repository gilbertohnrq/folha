import 'dart:io';

import 'package:app_client/app/core/constants/endpoints/endpoint.dart';
import 'package:app_client/app/core/service/http/interceptors/connectivity_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class HttpService extends DioForNative implements IHttpService {
  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter();

  HttpService() {
    options.baseUrl = Endpoints.baseUrl;
    options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'apiKey': 'z7cFbwoyvKu1wMi7NY6cORqHGh09Oxme',
    });
    options.setRequestContentTypeWhenNoPayload = true;
    setupInterceptors();
  }

  @override
  void setupInterceptors() {
    interceptors.add(ConnectivityInterceptor());
    // interceptors.add(AccountAuthorizationInterceptor());
    // interceptors.add(RouterInterceptor());
  }
}

abstract class IHttpService extends DioForNative {
  void setupInterceptors();
}
