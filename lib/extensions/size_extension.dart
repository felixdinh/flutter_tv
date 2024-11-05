import 'package:flutter/widgets.dart';

extension CoreSizeExtension on num{
  SizedBox get vBox => SizedBox(height: toDouble());
  SizedBox get hBox => SizedBox(width: toDouble());
  SizedBox get box => SizedBox(width: toDouble(),height: toDouble());
  BorderRadius get radius => BorderRadius.circular(toDouble());
  EdgeInsets get paddingA => EdgeInsets.all(toDouble());
  EdgeInsets get paddingH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingT => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingL => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingB => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get paddingR => EdgeInsets.only(right: toDouble());
}