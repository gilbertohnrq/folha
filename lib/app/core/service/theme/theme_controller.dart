import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:flutter_triple/flutter_triple.dart';

const themeIsDark = 'THEME_IS_DARKMODE';

class ThemeController {
  late final RxNotifier<bool> _isDark;
  bool get isDark => _isDark.value;

  final LocalStorage localStorage;

  ThemeController({required this.localStorage, required dynamic isDark}) {
    if(isDark != null){
      _isDark = RxNotifier<bool>(isDark as bool);
    } else {
      _isDark = RxNotifier<bool>(false);
    }
  }

  Future<void> setIsDark({required bool value}) async {
    _isDark.value = value;
    await localStorage.put(themeIsDark, value);
  }
}
