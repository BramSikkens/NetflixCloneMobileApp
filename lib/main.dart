import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "./Tabs/TabController.dart" as TabController;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Netflix Clone',
      home: TabController.TabController(),
    );
  }
}
