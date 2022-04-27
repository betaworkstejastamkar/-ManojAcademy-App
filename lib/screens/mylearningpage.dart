import 'package:flutter/material.dart';

class MylearningPage extends StatefulWidget {
  const MylearningPage({Key? key}) : super(key: key);

  @override
  State<MylearningPage> createState() => _MylearningPageState();
}

class _MylearningPageState extends State<MylearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Learning'),
        centerTitle: true,
      ),
    );
  }
}
