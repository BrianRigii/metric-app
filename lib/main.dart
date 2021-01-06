import 'package:flutter/material.dart';

import 'package:school/config.dart';
import 'package:school/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: config.themeData, home: SplashScreen());
  }
}
