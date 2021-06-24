import 'package:intl/intl.dart';

class DateHelper{

  static String formatDateNoticiaPrincipal(String date){
   try{
     final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
     final inputDate = inputFormat.parse(date);

     final outputFormat = DateFormat('dd/MM HH:mm');
     final outputDate = outputFormat.format(inputDate);
     return outputDate;
   }catch (e){
     return '00/00 00:00';
   }
  }

  static String formatDateNewsDetail(String date){
    try{
      final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      final inputDate = inputFormat.parse(date);

      final outputFormat = DateFormat('dd/MM/yyyy HH:mm');
      final outputDate = outputFormat.format(inputDate);
      return outputDate;
    }catch (e){
      return '00/00/0000 00:00';
    }
  }

  static String formatDateManyHoursAgo(String date){
    try{
      final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      final inputDate = inputFormat.parse(date);
      final Duration difference = DateTime.now().difference(inputDate);
      if(_differenceInMinutes(difference)){
        return 'há ${difference.inMinutes}m';
      } else if(_differenceInHours(difference)){
        return 'há ${difference.inHours}h';
      } else if (_differenceInDays(difference)){
        return 'há ${difference.inDays}d';
      } else {
        return 'agora';
      }
    }catch (e){
      return '00/00 00:00';
    }
  }

  static bool _differenceInDays(Duration difference) => difference.inDays != 0;

  static bool _differenceInHours(Duration difference) => difference.inDays == 0 && difference.inHours != 0;

  static bool _differenceInMinutes(Duration difference) => difference.inDays == 0 && difference.inHours == 0 && difference.inSeconds != 0;
}