import 'package:flutter/material.dart';

class SubPlanPage extends StatefulWidget {
  const SubPlanPage({Key? key}) : super(key: key);

  @override
  State<SubPlanPage> createState() => _SubPlanPageState();
}

class _SubPlanPageState extends State<SubPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plan'),
        centerTitle: true,
      ),
    );
  }
}
