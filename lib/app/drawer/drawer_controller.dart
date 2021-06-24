import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawerController {
  void ultimasNoticias() {
    _navigateHomeTab(0);
  }

  void politica() {
    _navigateHomeTab(1);
  }

  void economia() {
    _navigateHomeTab(2);
  }

  void cultura(){
    _navigateHomeTab(3);
  }

  void esportes(){
    _navigateHomeTab(4);
  }

  void _navigateHomeTab(int homeTabIndex){
    Modular.to.pop();
    Modular.to.navigate('../news/$homeTabIndex');
  }

  void myJournals() {
    Modular.to.pop();
    Modular.to.pushNamed('/my-journals');
  }

  Future<void> edicaoDigital() => Modular.to.pushNamed('/edicaoDigital');
  Future<void> meusJornais() => Modular.to.pushNamed('/meusJornais');
  Future<void> notificacoes() => Modular.to.pushNamed('/notificacoes');
  Future<void> settings() => Modular.to.pushNamed('/settings');
  Future<void> feedbackForm() => Modular.to.pushNamed('/feedback-form');
  Future<void> radio() => Modular.to.pushNamed('/radio');

  final String _facebook = 'https://www.facebook.com/folhape/';
  final String _twitter = 'http://www.twitter.com/folhape';
  final String _instagram = 'https://www.instagram.com/folhape/';
  final String _youtube = 'https://www.youtube.com/user/FolhadePernambuco';
  final String _whatsapp = 'https://api.whatsapp.com/send?phone=5581981879290';

  Future<void> launchURLFacebook() async {
    await _launchURL(_facebook);
  }

  Future<void> launchURLTwitter() async {
    await _launchURL(_twitter);
  }

  Future<void> launchURLInstagram() async {
    await _launchURL(_instagram);
  }

  Future<void> launchURLYoutube() async {
    await _launchURL(_youtube);
  }

  Future<void> launchURLWhatsapp() async {
    await _launchURL(_whatsapp);
  }

  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Page not found $url';
    }
  }
}
