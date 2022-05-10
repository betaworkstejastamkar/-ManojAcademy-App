import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/screens/subScreens/videoscreen.dart';

List tests = [
  {
    'name': 'A Tale of Two Birds',
    'question': 24,
  },
  {
    'name': 'The Friendly Mongoose ',
    'question': 74,
  },
  {
    'name': "The Shepherd's Treasure",
    'question': 55,
  },
  {
    'name': 'The Old-Clock Shop',
    'question': 19,
  },
];

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

class SubjectPage extends StatefulWidget {
  final String subjectname, tutorName;
  final num chapter, video;
  const SubjectPage(
      {Key? key,
      required this.subjectname,
      required this.chapter,
      required this.video,
      required this.tutorName})
      : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage>
    with TickerProviderStateMixin {
  // late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/subjectScreenbg.svg',
                    width: width,
                    // height: ,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                  'icons/Arrow-back-left.svg')),
                        ),
                        SizedBox(width: width - 380),
                        Text(widget.subjectname,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/videoThumbnail.png',
                              width: width - 100,
                            ),
                          ),
                          Column(
                            children: [
                              SvgPicture.asset('icons/playbtn.svg'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Demo',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  widget.subjectname,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('icons/points.svg'),
                            Text(
                              ' ${widget.chapter} Chapters',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('icons/points.svg'),
                            Text(
                              ' ${widget.video} total video',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                      width: 20,
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
                        const SizedBox(
                          height: 10,
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Tutor name : ${widget.tutorName}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
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
                        itemCount: tests.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return testCard(
                              index: index,
                              name: tests[index]['name'],
                              question: tests[index]['question']);
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

Widget testCard({index, name, question}) {
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
          child: Row(children: [
            Text(
              '$index.',
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
                Text(
                  '$question Question',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                )
              ],
            ),
          ]),
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
              min != 0 ? Text('${min}m ${sec}s') : Text('${sec}s')
            ],
          ),
        ),
      );
    },
  );
}
