import 'package:flutter/material.dart';

class Config {
  String appName = "Metric";
  String apiUrl = "http://104.131.126.206";
  String appVersion = "1.0.0";
  String appDatabase = "sample";
  String appIcon = "assets/images/icon.png";
  String appDescription = "School Management";
  String serverIp = "1.0.0.1";
  Color contrastColor = Colors.white;
  Color greenColor = Color.fromRGBO(49, 176, 125, 1);
  Color bluePurple = Color.fromRGBO(33, 48, 97, 1);
  Color orangeColor = Color.fromRGBO(246, 153, 57, 1);
  Color bluePurplelite = Color.fromRGBO(235, 235, 247, 1);
  EdgeInsets kpadding = EdgeInsets.all(16);
  ThemeData themeData = ThemeData(
      canvasColor: Color.fromRGBO(248, 249, 251, 1),
      primaryColor: Color.fromRGBO(68, 89, 156, 1),
      accentColor: Color.fromRGBO(77, 183, 160, 1),
      cardColor: Color.fromRGBO(237, 241, 250, 1));
}

var config = Config();
