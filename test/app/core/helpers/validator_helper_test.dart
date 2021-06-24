import 'package:app_client/app/core/helpers/validator_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Helpers - Validator Helpers', () {
    test('check if email is valid', () {
      const validMail = 'email@email.com';
      const invalidMail = 'mail.com';
      expect(ValidatorHelper.emailIsValid(validMail), null);
      expect(ValidatorHelper.emailIsValid(invalidMail), 'Este email não é válido');
    });

    test('check if phoneNumberIsValid is valid', () {
      const phoneNumberValid = '(99) 99999-9999';
      const phoneNumberInvalid = '99999999999';
      expect(ValidatorHelper.phoneNumberIsValid(phoneNumberValid), null);
      expect(ValidatorHelper.phoneNumberIsValid(phoneNumberInvalid), 'Este número de telefone não é válido');
    });

    test('check if nameIsValid is valid', () {
      const validName = 'name';
      const invalidName = 'na';
      expect(ValidatorHelper.nameIsValid(validName), null);
      expect(ValidatorHelper.nameIsValid(invalidName), 'Este nome não é válido');
    });
  });
}
