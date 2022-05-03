import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List subjectCardsBg = [
  {'image': 'assets/blueBox.svg', 'name': 'Maths'},
  {'image': 'assets/greenBox.svg', 'name': 'English'},
  {'image': 'assets/greyBox.svg', 'name': 'History'},
  {'image': 'assets/pinkBox.svg', 'name': 'Geography'},
  {'image': 'assets/purpleBox.svg', 'name': 'Hindi'},
  {'image': 'assets/yellowBox.svg', 'name': 'Science'},
];

Widget subjectcards(
    {required String imageurl,
    required String name,
    required double width,
    required double hegiht}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {},
      child: (Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SvgPicture.asset(
              imageurl,
              fit: BoxFit.fill,
              width: width,
              height: hegiht,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(name,
                  style: const TextStyle(
                      fontFamily: 'heebo',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      )),
    );
  });
}
