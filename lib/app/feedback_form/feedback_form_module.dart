import 'package:app_client/app/core/core_module.dart';
import 'package:app_client/app/feedback_form/feedback_form_controller.dart';
import 'package:app_client/app/feedback_form/feedback_form_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedbackFormModule extends Module {
  @override
  final List<Module> imports = [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind((i) => FeedbackFormController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FeedbackFormPage()),
  ];
}
