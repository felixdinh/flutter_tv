part of virtual_keyboard_multi_language;

/// Virtual keyboard actions.
///
///   Backspace, Return, Shift, Space, SwithLanguage
abstract class VirtualKeyboardKeyAction {
  final Widget icon;
  const VirtualKeyboardKeyAction(this.icon);
 }

class VirtualBackSpaceAction extends  VirtualKeyboardKeyAction{
  VirtualBackSpaceAction({
    Widget? icon,
    Color? color,
    }) : super(
    icon ??  Icon(Icons.backspace,color: color,)
  );
}
class VirtualReturnAction extends  VirtualKeyboardKeyAction{
  VirtualReturnAction({
    Widget? icon,
    Color? color,
  }) : super(
      icon ??  Icon(Icons.keyboard_return,color: color,)
  );
}

class VirtualShiftKAction extends  VirtualKeyboardKeyAction{
  VirtualShiftKAction({
    Widget? icon,
    Color? color,
  }) : super(
      icon ??  Icon(Icons.arrow_upward,color: color),
  );
}

class VirtualSpaceAction extends  VirtualKeyboardKeyAction{
  VirtualSpaceAction({
    Widget? icon,
    Color? color,
  }) : super(
    icon ??  Icon(Icons.space_bar,color: color),
  );
}

class VirtualSwitchLanguageAction extends  VirtualKeyboardKeyAction{
  VirtualSwitchLanguageAction({
    Widget? icon,
    Color? color,
  }) : super(
    icon ??  Icon(Icons.language,color: color),
  );
}
