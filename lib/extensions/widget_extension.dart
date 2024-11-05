import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget keyboardDismiss(BuildContext context) => GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: this,
  );
  Widget padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    bool animate = false,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: top ?? vertical ?? all ?? 0.0,
          bottom: bottom ?? vertical ?? all ?? 0.0,
          left: left ?? horizontal ?? all ?? 0.0,
          right: right ?? horizontal ?? all ?? 0.0,
        ),
        child: this,
      );
  Widget alignment(
      AlignmentGeometry alignment, {
        bool animate = false,
      }) =>
      Align(
        alignment: alignment,
        child: this,
      );
  Widget clipRRect({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
    bool animate = false,
  }) =>
      ClipRRect(
        clipper: clipper,
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
        child: this,
      );

  Widget xWidth(double width, {bool animate = false}) => ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: width),
    child: this,
  );

  Widget xHeight(double height, {bool animate = false}) => ConstrainedBox(
    constraints: BoxConstraints.tightFor(height: height),
    child: this,
  );
  Widget expanded({
    int flex = 1,
  }) =>
      Expanded(
        flex: flex,
        child: this,
      );
}