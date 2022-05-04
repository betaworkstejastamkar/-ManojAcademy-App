import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [SvgPicture.asset('assets/subjectScreenbg.svg')],
        ),
      ),
    );
  }
}
