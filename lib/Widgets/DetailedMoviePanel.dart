import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Movie.dart';
import '../utils/MovieProvider.dart';

class DetailedMoviePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie detailedMovie = context.watch<MovieProvider>().myMovie;

    return (Column(children: [
      Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage('https://picsum.photos/id/237/200/300')))),
      Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            detailedMovie.name,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ))
    ], crossAxisAlignment: CrossAxisAlignment.start));
  }
}
