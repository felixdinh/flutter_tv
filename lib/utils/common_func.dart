
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



const List<int> selectPhysicalKeys = [];
const List<LogicalKeyboardKey> selectKeys = [
  LogicalKeyboardKey.accept,
  LogicalKeyboardKey.enter,
  LogicalKeyboardKey.numpadEnter,
  LogicalKeyboardKey.select,
  LogicalKeyboardKey.open
];

bool isOk(LogicalKeyboardKey key, {PhysicalKeyboardKey? physicalKeyboardKey}) {
  debugPrint(
      'Received key event, Logical: ${key.debugName}, Physical ${physicalKeyboardKey?.debugName}');
  return selectKeys.any((element) => element == key) ||
      selectPhysicalKeys
          .any((element) => element == physicalKeyboardKey?.usbHidUsage);
}

KeyEventResult onTvSelect(KeyEvent event, BuildContext context, Function(BuildContext context) func) {
  if (event is KeyUpEvent) {
    debugPrint('onTvSelect, ${event.logicalKey}, $event');
    if (isOk(event.logicalKey, physicalKeyboardKey: event.physicalKey)) {
      func(context);
      return KeyEventResult.handled;
    }
  }

  return KeyEventResult.ignored;
}


DateTime? dateTimeOrNull(value) {
  try{
    if(value == null) return null;
    if(value is num){
      return DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000);
    }
    if(value is String){
      return DateTime.tryParse(value);
    }
    return null;

  } catch (e){
    debugPrint('error when Convert[dateTimeOrNull] \n $e');
    return null;
  }
}
String? getHmsInSeconds(Duration duration,{
  bool showH = true,
  bool showM = true,
  bool showS = false,
  String seperatedChar = ' ',
  String hStr = 'giờ',
}){

  return [
    showH && duration.inHours > 0 ? '${duration.inHours} $hStr' : '',
    showM && duration.inMinutes > 0 ? '${duration.inMinutes} phút' : '',
    showS && duration.inSeconds > 0 ? '${duration.inSeconds} giây' : ''
  ].join(seperatedChar);
}