import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_tv/screens/main_page.dart';
import 'package:test_tv/selec_list_page.dart';

import 'focusable_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent()},
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(title: 'Home'),
      ),
    );
  }
}




