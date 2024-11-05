import "package:flutter/material.dart";
import "package:flutter/services.dart";

class LeftButtonIntent extends Intent {}

class RightButtonIntent extends Intent {}

class UpButtonIntent extends Intent {}

class DownButtonIntent extends Intent {}

class EnterButtonIntent extends Intent {}

class ActionHandler {
  Widget handleArrowAndEnterActions({required Widget child}) {
    return Shortcuts(shortcuts: <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
      LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
      LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
      LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
      LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
    }, child: child);
  }
}
