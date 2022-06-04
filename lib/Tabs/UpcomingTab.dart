// Settings Tab
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "../Widgets/UpcomingMovieWidget.dart";

import "../Widgets/MovieListWidget.dart";
import "../Widgets/UpcomingMovieListWidget.dart";

class UpcomingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          middle: Text("Upcoming",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: (SafeArea(child: UpcomingMovieListWidget())));
  }
}
