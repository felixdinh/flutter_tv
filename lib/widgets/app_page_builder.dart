import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_tv/widgets/side_bar.dart';

class AppPageBuilder extends StatelessWidget {
  const AppPageBuilder({super.key,required this.controller});
  final SidebarXController controller;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child){
        return menuItemList[controller.selectedIndex].pageBuilder(context);
      }
    );
  }
}