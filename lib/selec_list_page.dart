
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_tv/widgets/list_movie.dart';
import 'package:test_tv/widgets/side_bar.dart';

class SelectListPage extends StatefulWidget {
  const SelectListPage({super.key, required this.title});

  final String title;

  @override
  State<SelectListPage> createState() => _SelectListPageState();
}

class _SelectListPageState extends State<SelectListPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  int? selectedIndex;
  int? onFocusIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTVCard(
              title: "General",
              itemCount: 10,
              itemBuilder: (context,index,isFocus){
                return Container(
                  color: Colors.black,
                  child: Center(
                    child: Text(
                        "$index"
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            ListTVCard(
              title: "General",
              itemCount: 10,
              itemBuilder: (context,index,isFocus){
                return Container(
                  color: Colors.black,
                  child: Center(
                    child: Text(
                        "$index"
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}