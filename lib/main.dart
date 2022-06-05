import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./Tabs/TabController.dart" as TabController;
import 'MovieProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Netflix Clone',
      home: TabController.TabController(),
    );
  }
}
