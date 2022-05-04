import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

List chapters = [
  {'name': 'A Tale of Two Birds', 'question': 24, 'completed': 66},
  {'name': 'The Friendly Mongoose ', 'question': 74, 'completed': 0},
  {'name': "The Shepherd's Treasure", 'question': 55, 'completed': 0},
  {'name': 'The Old-Clock Shop', 'question': 19, 'completed': 0},
];

// ignore: must_be_immutable
class TestChapterPage extends StatefulWidget {
  late String name, image, strengthMeter;
  TestChapterPage({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<TestChapterPage> createState() => _TestChapterPageState();
}

class _TestChapterPageState extends State<TestChapterPage> {
  num strengthMeter = 0;

  @override
  void initState() {
    for (int i = 0; i < chapters.length; i++) {
      strengthMeter += chapters[i]['completed'];
    }
    strengthMeter = strengthMeter / chapters.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        toolbarHeight: 150,
        title: Text(
          widget.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: Svg(widget.image), fit: BoxFit.cover),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Strength Meter : $strengthMeter%',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 180,
                      height: 10,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          color: const Color.fromRGBO(0, 129, 100, 1),
                          backgroundColor:
                              const Color.fromRGBO(229, 229, 229, 1),
                          value: strengthMeter / 100,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Chapters',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width - 400),
                child: SizedBox(
                  height: height,
                  child: ListView.builder(
                    itemCount: chapters.length,
                    itemBuilder: (context, index) {
                      return chapterCard(
                          index: index + 1,
                          name: "${chapters[index]['name']}",
                          question: "${chapters[index]['question']}",
                          precent: "${chapters[index]['completed']}");
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget chapterCard({index, name, question, precent}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(
              '$index',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  '$question Qestions',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                )
              ],
            ),
            const Spacer(),
            Text(
              '$precent%',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('icons/arrow-right.png'))
          ],
        ),
      ),
    ),
  );
}