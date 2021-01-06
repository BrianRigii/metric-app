import 'package:flutter/material.dart';
import 'package:school/ui/screens/calendar.dart';
import 'package:school/ui/screens/chat_screen.dart';
import 'package:school/ui/screens/student_home.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List get _pages => [
        StudentHome(),
        Calendar(),
        ChatScreen(),
      ];

  int _selectedPage = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            onTap: selectPage,
            currentIndex: _selectedPage,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline), label: '')
            ]));
  }
}
