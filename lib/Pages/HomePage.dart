import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Widgets/DetailedMoviePanel.dart';
import 'package:provider/provider.dart';
import '../Widgets/AccountPanel.dart';
import '../utils/MovieProvider.dart';
import 'LoginPage.dart';
import '../Widgets/MovieListWidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Home Tab
class HomeTab extends StatelessWidget {
  final movieDetailPanelController = new PanelController();
  final accountPanelController = new PanelController();
  FirebaseAuth auth = FirebaseAuth.instance;

  HomeTab() {}

  @override
  Widget build(BuildContext context) {
    var myMovie = context.watch<MovieProvider>().myMovie;

    return CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        navigationBar: CupertinoNavigationBar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            leading: Text(
              "N",
              style: TextStyle(
                  color: Color.fromARGB(255, 247, 2, 2),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            trailing: GestureDetector(
                child: Icon(Icons.account_box_rounded),
                onTap: () => {accountPanelController.open()})),
        child: Stack(children: [
          SafeArea(
              child: ListView(children: [
            MovieListWidget(
                "Trending",
                context.watch<MovieProvider>().popularMovies,
                movieDetailPanelController),
            MovieListWidget(
                "Trending",
                context.watch<MovieProvider>().popularMovies,
                movieDetailPanelController),
            MovieListWidget(
                "Trending",
                context.watch<MovieProvider>().popularMovies,
                movieDetailPanelController),
            MovieListWidget(
                "Trending",
                context.watch<MovieProvider>().popularMovies,
                movieDetailPanelController)
          ])),
          SlidingUpPanel(
              maxHeight: 670,
              minHeight: 0,
              color: Color.fromARGB(255, 0, 0, 0),
              defaultPanelState: PanelState.CLOSED,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              panel: DetailedMoviePanel(),
              controller: movieDetailPanelController),
          SlidingUpPanel(
              maxHeight: 670,
              minHeight: 0,
              color: Color.fromARGB(255, 0, 0, 0),
              defaultPanelState: PanelState.CLOSED,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              panel: AccountMoviePanel(),
              controller: accountPanelController),
        ]));
  }
}
