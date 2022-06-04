import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "../Tabs/HomeTab.dart";
import 'UpcomingTab.dart';

class TabController extends StatefulWidget {
  const TabController({Key? key}) : super(key: key);

  @override
  TabControllerState createState() {
    return TabControllerState();
  }
}

class TabControllerState extends State<TabController> {
  List<Widget> _tabs = [
    HomeTab(), // see the HomeTab class below
    UpcomingTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: 'Upcoming')
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return _tabs[index];
        });
  }
}
