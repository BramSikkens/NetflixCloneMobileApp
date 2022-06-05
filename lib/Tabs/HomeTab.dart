import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MovieProvider.dart';
import "../Widgets/MovieListWidget.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';

// Home Tab
class HomeTab extends StatelessWidget {
  final panelController = new PanelController();

  @override
  Widget build(BuildContext context) {
    var myMovie = context.watch<MovieProvider>().myMovie;

    return CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        navigationBar: const CupertinoNavigationBar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            leading: Text(
              "N",
              style: TextStyle(
                  color: Color.fromARGB(255, 247, 2, 2),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
        child: SlidingUpPanel(
            maxHeight: 700,
            minHeight: 0,
            defaultPanelState: PanelState.CLOSED,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            body: SafeArea(
                child: ListView(children: [
              MovieListWidget(
                  "Trending", context.watch<MovieProvider>().popularMovies,panelController)
            ])),
            panel: Center(child: Text(myMovie.name)),
            controller: panelController));
  }
}
