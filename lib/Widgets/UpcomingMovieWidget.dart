import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import "../Widgets/MovieListWidget.dart";

class UpcomingMovieWidget extends StatelessWidget {
  final String movieTitle;
  final String imageUrl;

  UpcomingMovieWidget({required this.movieTitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return (Row(children: [
      Container(
          height: 200,
          child: (Column(children: [
            Text("Jun",
                style: TextStyle(color: Color.fromARGB(167, 255, 255, 255))),
            Text("02",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ]))),
      Container(
        child: Column(children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/" + imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Text(movieTitle,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Container(
              width: 300,
              child: Text(
                  "If the style's inherit property is true, the style will be merged with the closest enclosing [DefaultTextStyle]. Otherwise, the style will replace the closest enclosing [DefaultTextStyle].",
                  style: TextStyle(
                      color: Color.fromARGB(167, 255, 255, 255),
                      fontSize: 12))),
          Divider(
            height: 30,
          )
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ),
    ]));
  }
}
