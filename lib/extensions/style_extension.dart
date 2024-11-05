import 'package:flutter/material.dart';
import 'package:test_tv/theme/theme.dart';


extension TextStyleExtension on TextStyle{
  // Font weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle spacing(double space) => copyWith(letterSpacing: space);
  TextStyle lineHeight(double lineHeight) => copyWith(height: lineHeight/(fontSize ?? 14));
  TextStyle get height140 => copyWith(height: 0.14);
  TextStyle get height120 => copyWith(height: 0.12);
}

extension ColorSchemeExtension on ColorScheme{
  Color get warning => CustomTheme.amber_800;
  Color get warningContainer => warning.withOpacity(.08);
  Color get success => CustomTheme.springGreen;
  Color get successContainer => success.withOpacity(.08);
  Color get info => CustomTheme.dodgerBlue;
  Color get disable => CustomTheme.grey_60;
}