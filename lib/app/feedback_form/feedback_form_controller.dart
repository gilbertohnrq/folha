import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

class FeedbackFormController {
  final formKey = GlobalKey<FormState>();

  final nameFieldController = TextEditingController(text: '');
  final emailFieldController = TextEditingController(text: '');
  final messageFieldController = TextEditingController(text: '');

  final name = RxNotifier('');
  final phoneNumber = RxNotifier('');
  final email = RxNotifier('');

  void onSubmitForm() {
    if (formKey.currentState!.validate()) {
      debugPrint('válido');
    } else {
      debugPrint('inválido');
    }
  }
}
