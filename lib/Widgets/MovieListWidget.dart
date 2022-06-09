import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import "../Models/Movie.dart";
import '../utils/MovieProvider.dart';

class MovieListWidget extends StatelessWidget {
  final Future<List<Movie>> movieList;
  final String title;
  PanelController panelController;

  //ctor
  MovieListWidget(this.title, this.movieList, this.panelController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            height: 220,
            child: FutureBuilder(
                future: movieList,
                builder: (context, AsyncSnapshot snapshot) {
                  // 1 . // WHILE THE CALL IS BEING MADE AKA LOADING
                  if (ConnectionState.active != null && !snapshot.hasData) {
                    return const Center(child: Text('Loading'));
                  }

                  // 2. // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                  if (ConnectionState.done != null && snapshot.hasError) {
                    return const Center(child: Text('Something went wrong :('));
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          context.read<MovieProvider>().UpdateMovie(
                              snapshot.data[index].name, "blabla.jpg"),
                          panelController.open()
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6.0),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          snapshot.data[index].backdropPath),
                                  fit: BoxFit.cover),
                            )),
                      );
                    },
                  );
                }))
      ],
    );
  }
}
