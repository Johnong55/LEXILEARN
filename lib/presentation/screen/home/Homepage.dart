import 'package:flutter/material.dart';
import 'package:lexilearn/presentation/screen/home/page/Home.dart';
import 'package:lexilearn/presentation/screen/home/page/Setting.dart';
import 'package:lexilearn/presentation/widget/general/CustomeAppBar.dart';
import 'package:lexilearn/presentation/widget/general/bottomNav.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    SettingPage(),
    Home(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
