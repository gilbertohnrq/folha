import 'package:app_client/app/columnist/columnist_details/columnist_details_module.dart';
import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/feedback_form/feedback_form_module.dart';
import 'package:app_client/app/home/home_module.dart';
import 'package:app_client/app/my_journals/my_journals_module.dart';
import 'package:app_client/app/notifications/notifications_module.dart';
import 'package:app_client/app/news_details/news_details_module.dart';
import 'package:app_client/app/splash/onboarding/onboarding_module.dart';
import 'package:app_client/app/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_client/app/app_settings/app_settings_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/settings', module: AppSettingsModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/onboarding', module: OnboardingModule()),
    ModuleRoute('/feedback-form', module: FeedbackFormModule()),
    ModuleRoute('/columnist-details', module: ColumnistDetailsModule()),
    ModuleRoute('/news-details', module: NewsDetailsModule()),
    ModuleRoute('/notifications', module: NotificationsModule()),
    ModuleRoute('/my-journals', module: MyJournalsModule()),
  ];
}
