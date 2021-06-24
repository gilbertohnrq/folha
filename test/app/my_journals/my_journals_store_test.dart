import 'package:flutter_test/flutter_test.dart';
import 'package:app_client/app/my_journals/my_journals_store.dart';
 
void main() {
  late MyJournalsStore store;

  setUpAll(() {
    store = MyJournalsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}