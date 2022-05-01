import 'package:flutter/material.dart';
import 'package:manojacademy/screens/subjectpage.dart';

List subjectCardsBg = [
  {'image': 'assets/bluebox.png', 'name': 'Maths'},
  {'image': 'assets/greenbox.png', 'name': 'English'},
  {'image': 'assets/greybox.png', 'name': 'History'},
  {'image': 'assets/pinkbox.png', 'name': 'Geography'},
  {'image': 'assets/purplebox.png', 'name': 'Hindi'},
  {'image': 'assets/yellowbox.png', 'name': 'Science'},
];

Widget subjectcards(
    {required String imageurl,
    required String name,
    required double width,
    required double hegiht}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SubjectPage(
                  image: imageurl,
                  name: name,
                )));
      },
      child: (Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
                width: width,
                height: hegiht,
                child: Image.asset(imageurl, fit: BoxFit.fill)),
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
