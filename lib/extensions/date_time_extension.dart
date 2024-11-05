import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CoreDateTimeExtension on DateTime? {
  int get toTimeStamp {
    if(this == null) return 0;
    return (this!.millisecondsSinceEpoch / 1000).floor();
  }
  String get uiDate {
    if(this == null) return "Không rõ";
    DateFormat format = DateFormat('dd/MM/yyyy');
    return format.format(this!);
  }
  String uiAppDateWithTime({separateChar = '-', bool timeAfter = false}) {
    if(this == null) return "Không rõ";
    late DateFormat format;
    if(timeAfter){
      format = DateFormat('dd/MM/yyyy HH:mm');

    } else {
      format = DateFormat('HH:mm dd/MM/yyyy');
    }

    return format.format(this!).replaceFirst(' ', ' $separateChar ');
  }
  String get getTime {
    if(this == null) return "Không rõ";
    late DateFormat format;
    format = DateFormat('HH:mm');

    return format.format(this!);
  }
}

extension DatetimeRageExtension on DateTimeRange? {
 bool contain(DateTime date){
   if(this == null) return false;
   return date.isAfter(this!.start) && date.isBefore(this!.end);
 }
}