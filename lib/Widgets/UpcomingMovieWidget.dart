import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingMovieWidget extends StatelessWidget {
  final String movieTitle;
  final String imageUrl;
  final String description;

  UpcomingMovieWidget(
      {required this.movieTitle,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return (Row(children: [
      Container(
          height: 200,
          child: (Column(children: [
            const Text("Jun",
                style: TextStyle(color: Color.fromARGB(167, 255, 255, 255))),
            const Text("02",
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
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/" + imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Text(movieTitle,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Container(
              width: 300,
              child: Text(description,
                  style: TextStyle(
                      color: Color.fromARGB(167, 255, 255, 255),
                      fontSize: 12))),
          const Divider(
            height: 30,
          )
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ),
    ]));
  }
}
