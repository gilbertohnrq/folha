import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:app_client/app/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageMock extends Mock implements LocalStorage {}

class IModularNavigationMock extends Mock implements IModularNavigator {}

void main() {
  final localStorage = LocalStorageMock();
  final modularNavigation = IModularNavigationMock();
  Modular.navigatorDelegate = modularNavigation;

  setUpAll(() {
    when(() => localStorage.put('seen', true)).thenAnswer((_) => Future.value());
    when(() => Modular.to.pushReplacementNamed('/home')).thenAnswer((_) => Future.value());
    when(() => Modular.to.pushReplacementNamed('/onboarding')).thenAnswer((_) => Future.value());
  });

  group('spash controller', () {
    test('skip onboarding page', () async {
      when(() => localStorage.get('seen')).thenAnswer((_) => Future.value(true));

      final controller = SplashController(localStorage: localStorage);
      await controller.checkFirstSeen();
      verify(() => Modular.to.pushReplacementNamed('/home')).called(1);
      verifyNever(() => localStorage.put('seen', true));
    });
    test('save true on the localstorage and navigate to onboarding page', () async {
      when(() => localStorage.get('seen')).thenAnswer((_) => Future.value(null));

      final controller = SplashController(localStorage: localStorage);
      await controller.checkFirstSeen();
      verify(() => Modular.to.pushReplacementNamed('/onboarding')).called(1);
      verify(() => localStorage.put('seen', true)).called(1);
    });
  });
}
