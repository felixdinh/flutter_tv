import 'package:flutter/material.dart';

Orientation getOrientation() {
  return (WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize
      .aspectRatio ??
      1) >
      1
      ? Orientation.landscape
      : Orientation.portrait;
}