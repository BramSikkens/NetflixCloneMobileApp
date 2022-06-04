import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class MovieListWidget extends StatefulWidget {
  final String title;
  final String movieListUrl;
  const MovieListWidget(
      {Key? key, required this.title, required this.movieListUrl})
      : super(key: key);

  @override
  MovieListState createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieListWidget> {
  late Future<List<Movie>> movieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieList = fetchMovies(widget.movieListUrl);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            height: 220,
            child: FutureBuilder(
                future: movieList,
                builder: (context, AsyncSnapshot snapshot) {
                  // 1 . // WHILE THE CALL IS BEING MADE AKA LOADING
                  if (ConnectionState.active != null && !snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }

                  // 2. // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                  if (ConnectionState.done != null && snapshot.hasError) {
                    return Center(child: Text('Something went wrong :('));
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/' +
                                      snapshot.data[index].backdropPath),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }))
      ],
    );
  }
}

class Movie {
  final String name;
  final String backdropPath;

  const Movie({required this.name, required this.backdropPath});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        backdropPath: (json["backdrop_path"] ?? ""),
        name: json["original_name"] ?? json["original_title"]);
  }
}

Future<List<Movie>> fetchMovies(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<Movie> test = List<Movie>.from((json.decode(response.body)["results"])
        .map((movie) => Movie.fromJson(movie)));

    return test;
  } else {
    throw Exception("Failed to load movies");
  }
}
