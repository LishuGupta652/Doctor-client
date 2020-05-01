import 'package:doctor_client/pages/index.dart';
import 'package:doctor_client/resources/firebase_repository.dart';
import 'package:doctor_client/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Doctor',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              return Home();
            } else {
              return LoginScreen();
            }
          },
        ));
  }
}
