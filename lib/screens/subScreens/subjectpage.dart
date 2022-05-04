import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/widgets/videoplayer.dart';

List chapters = [
  {
    'name': 'Demo Lectures',
    'videos': 3,
  },
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
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
                tabs: [
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
                                video: chapters[index]['videos']);
                          }),
                      ListView.builder(
                          itemCount: chapters.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return chapterCard(
                                index: index,
                                name: chapters[index]['name'],
                                video: chapters[index]['videos']);
                          }),
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

Widget chapterCard({index, name, video}) {
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    '$video Videos',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.5)),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset('icons/arrow-right.svg'))
            ],
          ),
        ),
      ),
    );
  });
}
