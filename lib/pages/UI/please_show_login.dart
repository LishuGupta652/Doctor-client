import 'package:doctor_client/pages/authDesign/loginPage.dart';
import 'package:doctor_client/pages/authDesign/signup.dart';
import 'package:doctor_client/pages/authDesign/welcomePage.dart';
import "package:flutter/material.dart";

class PleaseShowLoginSignup extends StatelessWidget {
  const PleaseShowLoginSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text("Please login or signup",
                            style: TextStyle(fontSize: 30)),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

    Widget _submitButton(String text) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }
  }
}
