import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/screens/subScreens/testchapterpage.dart';

List testPaperData = [
  {'image': 'assets/blueBox.svg', 'name': 'English', 'complete': 10},
  {'image': 'assets/greenBox.svg', 'name': 'Maths', 'complete': 20},
  {'image': 'assets/greyBox.svg', 'name': 'Science', 'complete': 0},
  {'image': 'assets/purpleBox.svg', 'name': 'Hindi', 'complete': 0},
];

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SvgPicture.asset(
                        'assets/testPageNarbar.svg',
                        width: width,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Text(
                          'Test Your Strength',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Text(
                      'Subjects',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: testPaperData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TestChapterPage(
                                    image: testPaperData[index]['image'],
                                    name: testPaperData[index]['name'],
                                  ),
                                ),
                              );
                            },
                            child: testCards(
                              imageurl: "${testPaperData[index]['image']}",
                              name: "${testPaperData[index]['name']}",
                              precent: testPaperData[index]['complete'],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget testCards({imageurl, name, precent}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 4,
    child: Row(children: [
      SizedBox(
        width: 80,
        height: 110,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          child: SvgPicture.asset(
            imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Strength Meter : $precent%',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  height: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      color: const Color.fromRGBO(0, 129, 100, 0.3),
                      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
                      value: precent / 100,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]),
  );
}
