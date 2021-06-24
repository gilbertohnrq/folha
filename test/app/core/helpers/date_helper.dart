import 'package:app_client/app/core/helpers/date_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Helpers - Date Helpers', () {

    test('check if api Date is valid', () {
      const validDate = '2021-06-02 20:20:00';
      const invalidDate = '2021/06/02 20:20:00';
      expect(DateHelper.formatDateNoticiaPrincipal(validDate), '02/06 20:20');
      expect(DateHelper.formatDateNoticiaPrincipal(invalidDate), '00/00 00:00');
    });

    test('test format date many hours ago', () {

      final date = DateTime.now();

      final fiveMinutesAgo = date.subtract(const Duration(minutes: 5));
      final oneHoursAgo = date.subtract(const Duration(hours: 1));
      final oneDayAgo = date.subtract(const Duration(days: 1));

      expect(DateHelper.formatDateManyHoursAgo(fiveMinutesAgo.toString()), 'há 5m');
      expect(DateHelper.formatDateManyHoursAgo(oneHoursAgo.toString()), 'há 1h');
      expect(DateHelper.formatDateManyHoursAgo(oneDayAgo.toString()), 'há 1d');
      expect(DateHelper.formatDateManyHoursAgo(date.toString()), 'agora');
    });
  });
}
