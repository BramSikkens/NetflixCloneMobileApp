import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/HomePage.dart';
import 'UpcomingTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    HomeTab(), // see the HomeTab class below
    UpcomingTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          items: const [
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
