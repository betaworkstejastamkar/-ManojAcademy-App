import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/api/getuserdata.dart';

List lectureData = [];

class MylearningPage extends StatefulWidget {
  const MylearningPage({Key? key}) : super(key: key);

  @override
  State<MylearningPage> createState() => _MylearningPageState();
}

class _MylearningPageState extends State<MylearningPage> {
  dynamic apiCall;

  @override
  void initState() {
    apiCall = getUserLecture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: apiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          lectureData = snapshot.data as List<dynamic>;

          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset('icons/arrow-left.svg'),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
              ),
              elevation: 1,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/book.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('My Learning'),
                  ],
                ),
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
                    itemCount: lectureData[0].length,
                    itemBuilder: (context, index) {
                      return lectureCards(
                          image: "${lectureData[0][index]['image']}",
                          name: "${lectureData[0][index]['name']}",
                          chapter: "${lectureData[0][index]['chapter']}",
                          video: "${lectureData[0][index]['totalvideo']}",
                          status: "${lectureData[0][index]['status']}",
                          precent: lectureData[0][index]['completed'],
                          width: width,
                          height: height);
                    },
                  ),
                ),
              )
            ]),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ));
      },
    );
  }
}

Widget lectureCards(
    {image, name, chapter, video, status, width, height, precent}) {
  var _precent = precent / 100;
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
                          SvgPicture.asset('icons/points.svg'),
                          Text(
                            ' $chapter Chapters',
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('icons/points.svg'),
                          Text(
                            ' $video total video',
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('icons/points.svg'),
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
                          SvgPicture.asset('icons/points.svg'),
                          const Text(
                            ' Test Series ',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('icons/points.svg'),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SizedBox(
                  width: width - 200,
                  height: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: const Color.fromRGBO(196, 196, 196, 1),
                      color: const Color.fromRGBO(0, 129, 100, 1),
                      value: _precent,
                      // semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
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
