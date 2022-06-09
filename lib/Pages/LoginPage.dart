import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Tabs/TabController.dart';
import '../utils/fire_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key) {}

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

    return firebaseApp;
  }

  LoginPageState() {}

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                              key: _formKey,
                              child: Column(children: <Widget>[
                                TextFormField(
                                  controller: _emailTextController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Color.fromARGB(255, 29, 29, 29),
                                    filled: true,
                                    hintStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    hintText: "Email",
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  controller: _passwordTextController,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    fillColor: Color.fromARGB(255, 29, 29, 29),
                                    filled: true,
                                    hintText: "Password",
                                  ),
                                ),
                              ])),
                          _isProcessing
                              ? CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                          });

                                          User? user = await FireAuth
                                              .signInUsingEmailPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (user != null) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage(),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                                  ],
                                )
                        ]));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
