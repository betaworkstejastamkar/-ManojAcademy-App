import 'package:flutter/material.dart';

class LivelecturesPage extends StatefulWidget {
  const LivelecturesPage({Key? key}) : super(key: key);

  @override
  State<LivelecturesPage> createState() => _LivelecturesPageState();
}

class _LivelecturesPageState extends State<LivelecturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Lectures'),
        centerTitle: true,
      ),
    );
  }
}
