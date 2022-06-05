import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'Models/Movie.dart';
import 'dart:convert';

class MovieProvider with ChangeNotifier {
  final Movie myMovie = Movie(name: "Test", backdropPath: "");
  late Future<List<Movie>> popularMovies = fetchMovies(
      "https://api.themoviedb.org/3/trending/all/week?api_key=4582beef3f9c4c12cf6a2cc07d83ce49");

  void UpdateMovie(String name, String backdropPath) {
    if (name != null) {
      myMovie.name = name;
    }

    if (backdropPath != null) {
      myMovie.backdropPath = backdropPath;
    }

    notifyListeners();
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
