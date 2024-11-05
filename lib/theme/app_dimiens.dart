import 'dart:io';

import 'package:flutter/material.dart';

class AppDimens {
  const AppDimens._();
  static const padding = 16.0;

  static const buttonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  static const inputPadding = EdgeInsets.symmetric(vertical: 15, horizontal: 16);
  static const alertPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 20);
  static const listTilePadding = EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  static const dividerHeight = 30.0;
  static const paragraphSpacing = 8.0;
  static const iconSize = 24.0;

  static const smallCorner = 6.0;
  static const mediumCorner = 12.0;
  static const largeCorner = 14.0;
  static const inputCorner = 16.0;
  static const alertCorner = 24.0;

  static const textHeight140 = 1.4;
  static const textHeight120 = 1.2;

  // static double appBarHeight = Platform.isIOS ? 48 : kToolbarHeight;
  /// Check more with iOS standard - https://ajith.blog/iOS-design-guide/
  static double appBarHeight = Platform.isIOS ? 44 : kToolbarHeight;
  static const bottomNavHeight = kBottomNavigationBarHeight;
  // Design size

  static const double designWidth = 390;
  static const double designHeight = 844;
}
