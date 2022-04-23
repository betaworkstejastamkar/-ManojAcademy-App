import 'package:flutter/material.dart';
import 'package:manojacademy/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Class 6'),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      body: Column(
        children: const [
          Center(
              child: Text(
            'This is Home Page',
          )),
        ],
      ),
    );
  }
}
