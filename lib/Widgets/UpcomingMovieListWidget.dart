import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import "../Models/Movie.dart";
import '../Models/UpcomingMovie.dart';
import "../Widgets/UpcomingMovieWidget.dart";

class UpcomingMovieListWidget extends StatefulWidget {
  const UpcomingMovieListWidget({Key? key}) : super(key: key);

  @override
  UpcomingMovieListState createState() {
    return UpcomingMovieListState();
  }
}

class UpcomingMovieListState extends State<UpcomingMovieListWidget> {
  late Future<List<UpcomingMovie>> movieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieList = fetchUpcomingMovies(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=4582beef3f9c4c12cf6a2cc07d83ce49&language=en-US&page=1");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            height: 650,
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
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return UpcomingMovieWidget(
                          movieTitle: snapshot.data[index].name,
                          imageUrl: snapshot.data[index].backdropPath,
                          description: snapshot.data[index].description);
                    },
                  );
                }))
      ],
    );
  }
}

Future<List<UpcomingMovie>> fetchUpcomingMovies(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<UpcomingMovie> test = List<UpcomingMovie>.from(
        (json.decode(response.body)["results"])
            .map((movie) => UpcomingMovie.fromJson(movie)));

    return test;
  } else {
    throw Exception("Failed to load movies");
  }
}
