import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_client/app/stand/stand_module.dart';
 
void main() {
  setUpAll(() {
    initModule(StandModule());
  });
}