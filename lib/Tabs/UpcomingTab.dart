import 'package:flutter/cupertino.dart';
import "../Widgets/UpcomingMovieListWidget.dart";

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          middle: Text("Upcoming",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: (SafeArea(child: UpcomingMovieListWidget())));
  }
}
