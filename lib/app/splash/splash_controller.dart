import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final LocalStorage localStorage;

  SplashController({required this.localStorage});

  Future checkFirstSeen() async {
    final dynamic _result = await localStorage.get('seen');
    if (_result != null && _result == true) {
       Modular.to.navigate('/home/news');
    } else {
      await localStorage.put('seen', true);
      await Modular.to.pushReplacementNamed('/onboarding');
    }
  }
}
