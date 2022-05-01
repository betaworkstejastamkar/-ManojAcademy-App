import 'package:flutter/material.dart';

List lectureData = [
  {
    'image': 'assets/bluebox.png',
    'name': 'Maths',
    'chapter': 16,
    'totalvideo': 100,
    'status': 'On chapter 2'
  },
  {
    'image': 'assets/greenbox.png',
    'name': 'English',
    'chapter': 12,
    'totalvideo': 90,
    'status': 'On chapter 2'
  },
  {
    'image': 'assets/greybox.png',
    'name': 'History',
    'chapter': 14,
    'totalvideo': 120,
    'status': 'On chapter 2'
  },
];

class MylearningPage extends StatefulWidget {
  const MylearningPage({Key? key}) : super(key: key);

  @override
  State<MylearningPage> createState() => _MylearningPageState();
}

class _MylearningPageState extends State<MylearningPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            Image.asset('icons/book.png'),
            const SizedBox(
              width: 5,
            ),
            const Text('My Learning'),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: lectureData.length,
              itemBuilder: (context, index) {
                return lectureCards(
                    image: "${lectureData[index]['image']}",
                    name: "${lectureData[index]['name']}",
                    chapter: "${lectureData[index]['chapter']}",
                    video: "${lectureData[index]['totalvideo']}",
                    status: "${lectureData[index]['status']}",
                    width: width,
                    height: height);
              },
            ),
          ),
        )
      ]),
    );
  }
}

Widget lectureCards({image, name, chapter, video, status, width, height}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      // side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(color: Color.fromARGB(0, 196, 196, 196)),
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Image.asset(
                  image,
                  height: 100,
                  width: 110,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('icons/points.png'),
                          Text(
                            ' $chapter Chapters',
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('icons/points.png'),
                          Text(
                            ' $video total video',
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('icons/points.png'),
                          const Text(
                            ' Live Sessions',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('icons/points.png'),
                          const Text(
                            ' Test Series ',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('icons/points.png'),
                          const Text(
                            ' Certificate',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width - 200,
                child: const LinearProgressIndicator(
                  color: Color.fromRGBO(196, 196, 196, 1),
                  value: 10,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    status,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.5)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
