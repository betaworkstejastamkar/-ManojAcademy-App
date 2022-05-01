import 'package:flutter/material.dart';

List testPaperData = [
  {'image': 'assets/bluebox.png', 'name': 'English', 'complete': '10'},
  {'image': 'assets/greybox.png', 'name': 'Maths', 'complete': '20'},
  {'image': 'assets/yellowbox.png', 'name': 'Science', 'complete': '0'},
  {'image': 'assets/bluebox.png', 'name': 'Hindi', 'complete': '0'},
];

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Subjects',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: height,
                  child: ListView.builder(
                      itemCount: testPaperData.length,
                      itemBuilder: (context, index) {
                        return testCards(
                          imageurl: "${testPaperData[index]['image']}",
                          name: "${testPaperData[index]['name']}",
                          precent: "${testPaperData[index]['complete']}",
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

Widget testCards({imageurl, name, precent}) {
  return Card(
    elevation: 4,
    child: Row(children: [
      SizedBox(
        height: 74,
        child: Image.asset(
          imageurl,
          width: 86,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Strength Meter : $precent%',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                width: 100,
                child: LinearProgressIndicator(
                  color: Color.fromRGBO(0, 129, 100, 0.3),
                  value: 10,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ],
          )
        ],
      )
    ]),
  );
}
