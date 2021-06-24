import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/splash/onboarding/onboarding_page.dart';
import 'package:app_client/app/splash/onboarding/onboarding_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/onboarding', child: (_, args) => const OnboardingPage()),
  ];
}
