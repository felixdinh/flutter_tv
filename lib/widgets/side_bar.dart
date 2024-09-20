import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_tv/model/menu_page_model.dart';
import 'package:test_tv/screens/category_screen.dart';
import 'package:test_tv/screens/setting_screen.dart';
import 'package:test_tv/selec_list_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.controller});

  final SidebarXController controller;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget.controller,
      headerBuilder: (context, extend) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Image.network(
                'https://cdn.tuoitre.vn/zoom/700_525/2019/5/8/avatar-publicitystill-h2019-1557284559744252594756-crop-15572850428231644565436.jpg',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
        );
      },
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
          ),
        ),
      items: menuItemList.map((item) => SidebarXItem(

        label: item.title,
        icon: item.icon,
        onTap: (){

        },
      )).toList()
    );
  }
}
final List<MenuPageModel> menuItemList = [
  MenuPageModel(0, icon: Icons.home, title: "Home", pageBuilder: (context) => SelectListPage(title: "Home"),),
  MenuPageModel(1, icon: Icons.category, title: "Category", pageBuilder: (context) => CategoryScreen(),),
  MenuPageModel(2, icon: Icons.settings, title: "Setting", pageBuilder: (context) => SettingScreen(),),
];
const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);