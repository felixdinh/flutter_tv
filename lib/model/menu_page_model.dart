import 'package:flutter/cupertino.dart';

class MenuPageModel {
  int index;
  final String title;
  final IconData icon;
  final Widget Function(BuildContext context) pageBuilder;

  MenuPageModel(
    this.index, {
      required this.icon,
    required this.title,
    required this.pageBuilder,
  });
}