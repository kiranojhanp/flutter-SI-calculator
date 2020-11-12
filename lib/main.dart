import 'package:flutter/material.dart';
// import 'app_screens/v2_calculator.dart';
// import 'app_screens/calculator_page.dart';

import 'app_screens/note_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        secondaryHeaderColor: Colors.black,
        brightness: Brightness.light,
      ),
      title: 'Note taking app',
      home: HomePage(),
    );
  }
}
