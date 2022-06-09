import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/LoginPage.dart';

class AccountMoviePanel extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      ElevatedButton(
          child: Text("Sign Out"),
          onPressed: () async => {
                await auth.signOut(),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )),
              })
    ], crossAxisAlignment: CrossAxisAlignment.start));
  }
}
