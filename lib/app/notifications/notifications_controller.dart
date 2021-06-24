import 'package:flutter_triple/flutter_triple.dart';

class NotificationsController {
  final _lastNews = RxNotifier<bool>(false);
  final _politics = RxNotifier<bool>(false);
  final _economy = RxNotifier<bool>(false);
  final _culture = RxNotifier<bool>(false);
  final _sports = RxNotifier<bool>(false);

  bool get lastNewsValue => _lastNews.value;
  bool get politicsValue => _politics.value;
  bool get economyValue => _economy.value;
  bool get cultureValue => _culture.value;
  bool get sportsValue => _sports.value;

  void setLastNews({bool? value}) => _lastNews.value = value!;
  void setPolitics({bool? value}) => _politics.value = value!;
  void setEconomy({bool? value}) => _economy.value = value!;
  void setCulture({bool? value}) => _culture.value = value!;
  void setSports({bool? value}) => _sports.value = value!;
}
