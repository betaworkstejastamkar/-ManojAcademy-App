// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    'videos': 3,
    "videoData": [
      {'name': 'Substances in Daily Use', 'time': '00:54'},
      {'name': 'Nutrition and Diet', 'time': '01:54'},
      {'name': 'Substances in Daily Use ', 'time': '00:43'},
    ]
  },
  {
    'name': 'Natural Resources - Air, Water and Land',
    'videos': 74,
    "videoData": [
      {'name': 'Substances in Daily Use', 'time': '00:54'},
      {'name': 'Nutrition and Diet', 'time': '01:54'},
      {'name': 'Substances in Daily Use ', 'time': '00:21'},
    ]
  },
  {
    'name': "The Living World ",
    'videos': 55,
    "videoData": [
      {'name': 'Substances in Daily Use', 'time': '00:54'},
      {'name': 'Nutrition and Diet', 'time': '02:54'},
      {'name': 'Substances in Daily Use ', 'time': '00:24'},
    ]
  },
  {
    'name': 'Diversity in Living Things and their Classification',
    'videos': 19,
    "videoData": [
      {'name': 'Substances in Daily Use', 'time': '00:54'},
      {'name': 'Nutrition and Diet', 'time': '01:54'},
      {'name': 'Substances in Daily Use ', 'time': '00:54'},
    ]
  },
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'videos': 19
  },
  {'name': 'The Old-Clock Shop', 'videos': 19},
  {'name': 'Natural Resources - Air, Water and Land', 'videos': 74},
  {'name': "The Living World ", 'videos': 55},
  {'name': 'Diversity in Living Things and their Classification', 'videos': 19},
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'videos': 19
  },
  {'name': 'The Old-Clock Shop', 'videos': 19},
  {'name': 'Natural Resources - Air, Water and Land', 'videos': 74},
  {'name': "The Living World ", 'videos': 55},
  {'name': 'Diversity in Living Things and their Classification', 'videos': 19},
  {
    'name': "Substances in the Surroundings - Their States and Properties",
    'videos': 19
  },
  {'name': 'The Old-Clock Shop', 'videos': 19},
];

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  const VideoPlayerCard(),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Stone age man',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Icon(
                        Icons.alarm,
                        color: Color.fromRGBO(165, 153, 153, 1),
                      ),
                    ),
                    const Padding(
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
                            return chapterCard(
                                index: index,
                                name: chapters[index]['name'],
                                video: chapters[index]['videos'],
                                videoData: chapters[index]['videoData']);
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
                              question: test[index]['question'],
                              precent: test[index]['completed']);
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

Widget chapterCard({index, name, video, videoData}) {
  return Builder(builder: (context) {
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
          child: ExpandablePanel(
              header: Row(
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
                          width: MediaQuery.of(context).size.width - 200,
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
              collapsed: Padding(
                padding: const EdgeInsets.fromLTRB(60, 3, 0, 0),
                child: Text(
                  '$video Videos',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                // expandIcon: Icons.keyboard_arrow_right,
              ),
              expanded: videoData != null
                  ? ListView.builder(
                      itemCount: videoData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return videoList(
                            name: videoData[index]['name'],
                            time: videoData[index]['time']);
                      })
                  : const Text(''),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: expanded,
                    ),
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              }),
        ),
      ),
    );
  });
}

Widget videoList({name, time}) {
  late int sec, min;
  if (time != null) {
    List tempTime = time.split(":");
    sec = int.parse(tempTime[1]);
    min = int.parse(tempTime[0]);
  }

  return Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const VideoScreen(),
              ),
            );
          },
          child: Row(
            children: [
              SvgPicture.asset('icons/videoBtn.svg'),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(2, 1, 1, 1),
                  ),
                ),
              ),
              const Spacer(),
              min == 0 ? Text('${min}m ${sec}s') : Text('${sec}s')
            ],
          ),
        ),
      );
    },
  );
}
