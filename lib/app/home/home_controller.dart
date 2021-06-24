import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeController {

  HomeController(){
    Modular.to.addListener(() {
      final int bottomIndex = _resolveCurrentBottonBar(Modular.to.path);
      setBottomTabSelected(bottomIndex);
    });
  }

  final _bottomTabSelected = RxNotifier<int>(0);
  int get bottomTabSelected => _bottomTabSelected.value;
  void setBottomTabSelected(int index) => _bottomTabSelected.value = index;
  void setBottomTabSelectedAndNavigate(int index) {
    if(index == 0){
      Modular.to.navigate('../news/');
    } else if(index == 1){
      Modular.to.navigate('../stand/');
    } else {
      Modular.to.navigate('../columnist/');
    }
  }

  int _resolveCurrentBottonBar(String path){
    switch(Modular.to.path){
      case '/home/news/': return 0;
      case '/home/stand/': return 1;
      case '/home/columnist/': return 2;
      default: return 0;
    }
  }
}
