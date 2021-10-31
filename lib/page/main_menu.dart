import 'package:flutter/material.dart';
import 'package:pos_apps/page/home_page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int seletecTab = 0;

  void changeSelectTab(int index) {
    setState(() {
      seletecTab = index;
    });
  }

  var pageOption = [];

  @override
  void initState() {
    pageOption = [HomePage(), HomePage(), HomePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOption[seletecTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeSelectTab,
        currentIndex: seletecTab,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, size: 30), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: 'Profile')
        ],
      ),
    );
  }
}
