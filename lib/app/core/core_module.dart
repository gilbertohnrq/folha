import 'package:app_client/app/core/service/http/http_service.dart';
import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:app_client/app/core/service/local_storage/shared_preferences_storage_impl.dart';
import 'package:app_client/app/core/service/notifications/notifications_service.dart';
import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:app_client/app/drawer/drawer_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance(), export: true),
    Bind.factory<LocalStorage>((i) => SharedPreferencesStorage(i()), export: true),
    AsyncBind((i) async => ThemeController(localStorage: i(), isDark: await i<LocalStorage>().get(themeIsDark)), export: true),
    Bind.factory<IHttpService>((i) => HttpService(), export: true),
    Bind.singleton((i) => NotificationsService(), export: true),
    Bind.singleton((i) => CustomDrawerController(), export: true),
  ];
}
