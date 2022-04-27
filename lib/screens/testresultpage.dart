import 'package:flutter/material.dart';

class TestResultPage extends StatefulWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results'),
        centerTitle: true,
      ),
    );
  }
}
