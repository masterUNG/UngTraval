import 'package:flutter/material.dart';

class MyStyle {
  Color textColor = Color.fromARGB(0xff, 0x00, 0x3d, 0x33);
  Color mainColor = Color.fromARGB(0xff, 0x43, 0x98, 0x89);
  Color barColor = Color.fromARGB(0xff, 0x00, 0x69, 0x5c);

  TextStyle h1Text = TextStyle(
    fontFamily: 'Lobster',
    color: Color.fromARGB(0xff, 0x00, 0x3d, 0x33),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );

  TextStyle h2Text = TextStyle(
    fontFamily: 'Lobster',
    color: Color.fromARGB(0xff, 0x00, 0x3d, 0x33),
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  MyStyle();
}
