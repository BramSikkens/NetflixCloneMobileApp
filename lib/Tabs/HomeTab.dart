// Settings Tab
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import "../Widgets/MovieListWidget.dart";

// Home Tab
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        navigationBar: CupertinoNavigationBar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            leading: Text(
              "N",
              style: TextStyle(
                  color: Color.fromARGB(255, 247, 2, 2),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
        child: SafeArea(
            child: ListView(children: [
          MovieListWidget(
              title: "Trending",
              movieListUrl:
                  "https://api.themoviedb.org/3/trending/all/week?api_key=4582beef3f9c4c12cf6a2cc07d83ce49"),
          MovieListWidget(
              title: "Popular",
              movieListUrl:
                  "https://api.themoviedb.org/3/movie/popular?api_key=4582beef3f9c4c12cf6a2cc07d83ce49"),
          MovieListWidget(
              title: "title3",
              movieListUrl:
                  "https://api.themoviedb.org/3/trending/all/week?api_key=4582beef3f9c4c12cf6a2cc07d83ce49"),
          MovieListWidget(
              title: "title4",
              movieListUrl:
                  "https://api.themoviedb.org/3/trending/all/week?api_key=4582beef3f9c4c12cf6a2cc07d83ce49"),
          MovieListWidget(
              title: "title5",
              movieListUrl:
                  "https://api.themoviedb.org/3/trending/all/week?api_key=4582beef3f9c4c12cf6a2cc07d83ce49"),
        ])));
  }
}
