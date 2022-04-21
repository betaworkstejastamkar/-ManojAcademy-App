import 'package:flutter/material.dart';
import 'package:manojacademy/screens/register.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,

        primaryColor: const Color.fromRGBO(0, 129, 100, 1),
        // primaryColorDark: const Color.fromRGBO(0, 129, 100, 1),

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          bodyText1:
              TextStyle(fontSize: 18, color: Color.fromRGBO(0, 129, 100, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(0, 129, 100, 1)),
        ),
      ),
      home: const Register()));
}
