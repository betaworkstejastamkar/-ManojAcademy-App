import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/api/getstroage.dart';
import 'package:manojacademy/widgets/testchapter.dart';
import 'package:manojacademy/widgets/videoplayer.dart';

List test = [
  {'name': 'A Tale of Two Birds', 'question': 24, 'completed': 66},
  {'name': 'The Friendly Mongoose ', 'question': 74, 'completed': 0},
  {'name': "The Shepherd's Treasure", 'question': 55, 'completed': 0},
  {'name': 'The Old-Clock Shop', 'question': 19, 'completed': 0},
];

List files = ['Notes', 'Question Bank', 'Assignments'];

List chapters = [
  {
    'name': 'Demo Lectures',
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': 'Natural Resources - Air, Water and Land',
    'url': 'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
  },
  {
    'name': "The Living World ",
    'url': 'https://samplelib.com/lib/preview/mp4/sample-20s.mp4'
  },
  {
    'name': 'Diversity in Living Things and their Classification',
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'url': 'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
  },
  {
    'name': 'The Old-Clock Shop',
    'url': 'https://samplelib.com/lib/preview/mp4/sample-20s.mp4'
  },
  {
    'name': 'Natural Resources - Air, Water and Land',
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': "The Living World ",
    'url': 'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
  },
  {
    'name': 'Diversity in Living Things and their Classification',
    'url': 'https://samplelib.com/lib/preview/mp4/sample-20s.mp4'
  },
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': 'The Old-Clock Shop',
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': 'Natural Resources - Air, Water and Land',
    'url': 'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
  },
  {
    'name': "The Living World ",
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
  {
    'name': 'Diversity in Living Things and their Classification',
    'url': 'https://samplelib.com/lib/preview/mp4/sample-30s.mp4'
  },
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'url': 'https://samplelib.com/lib/preview/mp4/sample-20s.mp4'
  },
  {
    'name': 'The Old-Clock Shop',
    'url':
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
  },
];

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with TickerProviderStateMixin {
  String video =
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget chapterCard({index, name, videoUrl}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  '$index.',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width - 200,
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  VideoPlayerCard(
                    type: "network",
                    videoUrl: video,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('icons/arrow-left.svg',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Stone age man',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'History',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(165, 153, 153, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Icon(
                                Icons.alarm,
                                color: Color.fromRGBO(165, 153, 153, 1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                '2m 05s',
                                style: TextStyle(
                                  color: Color.fromRGBO(165, 153, 153, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      openFile(
                        filename: 'test.mp4',
                        url: video,
                      );
                    },
                    child: SizedBox(
                        width: width / 5,
                        child: SvgPicture.asset('icons/download.svg')),
                  )
                ],
              ),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                isScrollable: false,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                    child: Text(
                      'Chapters',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'File',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Test',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: width,
                  height: height / 1.2,
                  child: TabBarView(
                    physics: const ScrollPhysics(),
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: chapters.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  video = chapters[index]['url'];
                                });
                              },
                              child: chapterCard(
                                index: index,
                                name: chapters[index]['name'],
                                videoUrl: chapters[index]['url'],
                              ),
                            );
                          }),
                      ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          return filesCard(
                            name: files[index],
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: test.length,
                        itemBuilder: (context, index) {
                          return testCard(
                            index: index + 1,
                            name: test[index]['name'],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget filesCard({name}) {
  return Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                SvgPicture.asset('icons/Paperclip-1.svg',
                    color: const Color.fromARGB(255, 165, 153, 153)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset('icons/download.svg',
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ],
            ),
          ),
        ),
      );
    },
  );
}
