import 'package:dio/dio.dart';


class AccountAuthorizationInterceptor extends Interceptor {
  // final AuthStore authStore = Modular.get<AuthStore>();

  AccountAuthorizationInterceptor();

  // @override
  // Future onError(DioError err) async {
  //   final _dio = Modular.get<Dio>();
  //   if (err.response?.statusCode == 401) {
  //     // var credentials = authStore.getCredentials;
  //     // ignore: unnecessary_null_comparison
  //     if (authStore.token != null && authStore.token.isNotEmpty) {
  //       await authStore.refreshLogin();
  //       return _dio.request(
  //         err.response!.request.path,
  //         data: err.response!.request.data,
  //       );
  //     }
  //     authStore.logout();
  //   }
  // }

  // @override
  // Future onRequest(RequestOptions options) async {
  //   if (options.data == null || options.data is Map) {
  //     options.data ??= {};
  //     var token = await _getToken;
  //     var user = await _getUser;
  //     var cpf = await _getCpf;
  //     if (token != null && user != null && cpf != null && token.isNotEmpty) {
  //       // options.data['x-access-token'] = token;
  //       // options.data['user'] = user;
  //       // options.data['cpf'] = cpf;
  //       options.headers.addAll(
  //         {'x-access-token': token, 'user': user, 'cpf': cpf},
  //       );
  //     }
  //   }
  //   return super.onRequest(options);
  // }

  // Future<String?> get _getToken async {
  //   try {
  //     final storage = Modular.get<LocalStorage>();
  //     final account = await storage.get('x-access-token');
  //     return '$account';
  //   } catch (e) {
  //     return '';
  //   }
  // }
  //
  // Future<String?> get _getUser async {
  //   try {
  //     final storage = Modular.get<LocalStorage>();
  //     final account = await storage.get('access-user');
  //     return '$account';
  //   } catch (e) {
  //     return '';
  //   }
  // }
  //
  // Future<String?> get _getCpf async {
  //   try {
  //     final storage = Modular.get<LocalStorage>();
  //     final account = await storage.get('access-cpf');
  //     return '$account';
  //   } catch (e) {
  //     return '';
  //   }
  // }
}
