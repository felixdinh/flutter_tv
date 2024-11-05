part of '../virtual_keyboard_multi_language.dart';

/// Virtual Keyboard key
class VirtualKeyboardKey {
  String? text;
  String? capsText;
  final VirtualKeyboardKeyType keyType;
  final VirtualKeyboardKeyAction? action;

  VirtualKeyboardKey(

      {this.text, this.capsText, required this.keyType, this.action}) {
    if (text == null && action != null) {
      text = action is VirtualSpaceAction
          ? ' '
          : (action is VirtualReturnAction ? '\n' : '');
    }
    if (capsText == null && action != null) {
      capsText = action is VirtualSpaceAction
          ? ' '
          : (action is VirtualReturnAction ? '\n' : '');
    }
  }

}
