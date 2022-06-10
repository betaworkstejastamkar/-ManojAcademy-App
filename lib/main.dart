import 'package:flutter/material.dart';
// import 'package:manojacademy/screens/login.dart';
import 'package:manojacademy/screens/register.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1920,
            minWidth: 370,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(370, name: MOBILE),
              const ResponsiveBreakpoint.resize(720, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(
              color: Colors.white,
            ),
          ),
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,

        primaryColor: const Color.fromRGBO(0, 129, 100, 1),
        // primaryColorDark: const Color.fromRGBO(0, 129, 100, 1),

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
