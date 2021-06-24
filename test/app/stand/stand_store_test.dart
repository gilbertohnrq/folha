import 'package:flutter_test/flutter_test.dart';
import 'package:app_client/app/stand/stand_store.dart';
 
void main() {
  late StandStore store;

  setUpAll(() {
    store = StandStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}