import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: mengobrol_uiapp());
  }
}
