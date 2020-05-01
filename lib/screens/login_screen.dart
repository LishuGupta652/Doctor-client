import 'package:doctor_client/pages/index.dart';
import 'package:doctor_client/resources/firebase_repository.dart';
import 'package:doctor_client/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: UniversalVariables.lightOrangeColor,
          body: Stack(
            children: <Widget>[
              Center(child: loginButton()),
              isLoginPressed
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
            ],
          )),
    );
  }

  Widget loginButton() {
    return Shimmer.fromColors(
      baseColor: UniversalVariables.orangeColor,
      highlightColor: UniversalVariables.senderColor,
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        onPressed: () => performLogin(),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  void performLogin() {
    setState(() {
      isLoginPressed = true;
    });
    _repository.signIn().then((FirebaseUser user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print('There was an error.');
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = true;
      });
      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          print("button pushed");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Home();
          }));
        });
      } else {
        print("button pushed");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Home();
        }));
      }
    });
  }
}
