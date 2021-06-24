import 'package:app_client/app/core/helpers/validator_helper.dart';
import 'package:app_client/app/feedback_form/feedback_form_controller.dart';
import 'package:app_client/app/widgets/custom_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:konoha/konoha.dart';

class FeedbackFormPage extends StatelessWidget {
  final formController = Modular.get<FeedbackFormController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fale com a gente',
          style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Seja bem vindo! Preencha o formulário que nós entraremos em contato.',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 15),
              Form(
                key: formController.formKey,
                child: Column(
                  children: [
                    CustomFormWidget(
                      label: 'Nome',
                      controller: formController.nameFieldController,
                      validator: ValidatorHelper.nameIsValid,
                    ),
                    CustomFormWidget(
                      label: 'Email ou telefone',
                      controller: formController.emailFieldController,
                      validator: ValidatorHelper.phoneOrEmailIsValid,
                    ),
                    CustomFormWidget(
                      label: 'Sua mensagem',
                      maxLines: 10,
                      controller: formController.messageFieldController,
                      validator: ValidatorHelper.messageIsValid,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomRight,
                child: KonohaTextButton(
                  onPressed: formController.onSubmitForm,
                  label: 'ENVIAR',
                ),
              ),
              const SizedBox(height: 41),
            ],
          ),
        ),
      ),
    );
  }
}
