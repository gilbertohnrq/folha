import 'package:flutter_test/flutter_test.dart';
import 'package:app_client/app/columnist/columnist_store.dart';
 
void main() {
  late ColumnistStore store;

  setUpAll(() {
    store = ColumnistStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}