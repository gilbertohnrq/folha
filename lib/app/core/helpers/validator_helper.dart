import 'package:email_validator/email_validator.dart';

class ValidatorHelper {
  static String? phoneOrEmailIsValid(String? value) {
    if (value == null) return 'Campo obrigatório';
    if (EmailValidator.validate(value) || value.length == 15) {
      return null;
    } else {
      return 'Este email ou telefone não é válido';
    }
  }

  static String? emailIsValid(String? email) {
    if (email == null) return 'Campo obrigatório';
    if (EmailValidator.validate(email)) {
      return null;
    } else {
      return 'Este email não é válido';
    }
  }

  static String? nameIsValid(String? value) {
    if (value == null) return 'Campo obrigatório';
    if (value.length > 2) {
      return null;
    } else {
      return 'Este nome não é válido';
    }
  }

  static String? messageIsValid(String? value) {
    if (value != '') {
      return null;
    } else {
      return 'Você deve digitar uma mensagem';
    }
  }

  static String? phoneNumberIsValid(String? value) {
    if (value == null) return 'Campo obrigatório';
    if (value.length == 15) {
      return null;
    } else {
      return 'Este número de telefone não é válido';
    }
  }
}
