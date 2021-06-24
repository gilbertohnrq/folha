import 'package:flutter_test/flutter_test.dart';
import 'package:app_client/app/notifications/notifications_store.dart';
 
void main() {
  late NotificationsStore store;

  setUpAll(() {
    store = NotificationsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}