import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "../Tabs/HomeTab.dart";
import "../Tabs/SettingsTab.dart";

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
    SettingTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return _tabs[index];
        });
  }
}
