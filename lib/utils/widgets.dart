import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

Widget _title() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'A',
        style: GoogleFonts.portLligatSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.orange,
        ),
        children: [
          TextSpan(
            text: 'pp',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'oint',
            style: TextStyle(color: Colors.orange, fontSize: 30),
          ),
        ]),
  );
}

Widget _backButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          ),
          Text('Back',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  );
}
