
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_tv/widgets/app_page_builder.dart';
import 'package:test_tv/widgets/side_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  final menuFocusNode = FocusScopeNode(),
      sideBarNode = FocusScopeNode(),
    pageFocusNode = FocusScopeNode();


  @override
  void initState() {
    super.initState();
    // pageFocusNode.onKeyEvent = (node,event){
    //   print("pageFOcusNode: $node - $event");
    //   if(node.debugLabel == pageFocusNode.debugLabel && node.hasFocus == false) {
    //     if(event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowLeft){
    //       _controller.setExtended(true);
    //       menuFocusNode.requestFocus(sideBarNode);
    //       return KeyEventResult.handled;
    //     }
    //     return KeyEventResult.skipRemainingHandlers;
    //   }
    //   return KeyEventResult.ignored;
    // };
  }
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.swap_calls),
        onPressed: () {
         if(pageFocusNode.hasFocus){
           menuFocusNode.requestFocus(sideBarNode);
           _controller.setExtended(true);
         }
         if(sideBarNode.hasFocus){
           menuFocusNode.requestFocus(pageFocusNode);
           _controller.setExtended(false);
         }
        },
      ),
      appBar: isSmallScreen ? AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ) : null,
      drawer: SideBar(controller: _controller),
      body: FocusScope(
        node: menuFocusNode,
        autofocus: true,
        child: Row(
          children: [
            if(!isSmallScreen) FocusScope(
              parentNode: menuFocusNode,
              node: sideBarNode,
              skipTraversal: true,
              child: SideBar(controller: _controller),
            ),
            Expanded(
              child: FocusScope(
                parentNode: menuFocusNode,
                node: pageFocusNode,
                autofocus: true,
                onFocusChange: (isFocus){
                  print("pageFocus eeeee:$isFocus");
                },
                child: AppPageBuilder(controller: _controller),
              ),
            ),
          ],
        ),
      ),

    );
  }
}