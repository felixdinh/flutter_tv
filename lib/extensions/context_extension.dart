import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_tv/theme/app_dimiens.dart';

extension ContextEffx on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  double get screenHeight => _mediaQuery.size.height;
  double get screenWidth => _mediaQuery.size.width;
  double screenWidthPercent(int percent) => screenWidth * (percent/100);
  double screenHeightPercent(int percent) => screenHeight * (percent/100);
  double get safeBottomHeight => min(_mediaQuery.viewPadding.bottom,20);
  double get safeTopHeight => _mediaQuery.viewPadding.top;
  double get safeBottomNavHeight => min(_mediaQuery.viewPadding.bottom,34);

  void dismissKeyBoard(){
    try{
      FocusScope.of(this).unfocus();
    } catch(_){}
  }

  EdgeInsets get bottomNavPadding => const EdgeInsets.symmetric(horizontal: AppDimens.padding).copyWith(top: 8, bottom: safeBottomHeight + 8);
}