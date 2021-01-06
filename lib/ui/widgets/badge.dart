import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Color color;
  final String text;
  const Badge({this.color, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      color: color.withOpacity(.1),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}
