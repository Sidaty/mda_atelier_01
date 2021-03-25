import 'package:flutter/material.dart';
import 'package:mda_atelier_01/home_page.dart';

void main() {
  runApp(MdaAtelier1App());
}

class MdaAtelier1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
