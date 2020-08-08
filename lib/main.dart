import 'package:doctor_client/pages/authDesign/loginPage.dart';
import 'package:doctor_client/pages/authDesign/signup.dart';
import 'package:doctor_client/resources/firebase_repository.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_client/pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  var textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Doctor',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          body1: GoogleFonts.montserrat(textStyle: textTheme.body1),
        ),
      ),
      home: Home(),
      // home: FutureBuilder(
      //   future: _repository.getCurrentUser(),
      //   builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
      //     if (snapshot.hasData) {
      //       return Home();
      //     } else {
      //       // return LoginScreen();
      //       return Home();
      //     }
      //   },
      // ),
    );
  }
}
