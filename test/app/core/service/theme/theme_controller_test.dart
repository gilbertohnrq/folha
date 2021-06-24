import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageMock extends Mock implements LocalStorage {}

void main() {
  final localStorage = LocalStorageMock();

  test('change dark mode', () {
    when(() => localStorage.put(any(), true)).thenAnswer((_) => Future.value());
    final controller = ThemeController(localStorage: localStorage,isDark: false);
    controller.setIsDark(value: true);
    expect(controller.isDark, true);
  });
}
