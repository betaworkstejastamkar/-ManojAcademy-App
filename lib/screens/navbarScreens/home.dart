import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/data/studentdata.dart';
import 'package:manojacademy/screens/subScreens/notificationscreen.dart';
import 'package:manojacademy/widgets/carouselwindow.dart';
import 'package:manojacademy/widgets/drawer.dart';
import 'package:manojacademy/widgets/popularcards.dart';
import 'package:manojacademy/widgets/subjectcards.dart';
import 'package:manojacademy/widgets/videocards.dart';

List imageDataItems = [
  'assets/carousalbg (2).png',
  'assets/carousalbg.png',
];

List videoCardData = [
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'Stone age man',
    'subname': 'History',
    'hours': '2',
    'mintes': '30'
  },
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'How things work',
    'subname': 'Science',
    'hours': '2',
    'mintes': '27'
  },
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'The Power of G',
    'subname': 'Science',
    'hours': '2',
    'mintes': '40'
  }
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = studentClass;
  var items = [
    'class 4',
    'class 5',
    'class 6',
    'class 7',
    'class 8',
    'class 9',
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset('icons/bell.svg'),
            ),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: InkWell(
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(dropdownvalue),
                const SizedBox(
                  width: 5,
                ),
                const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: SvgPicture.asset('icons/align-left.svg'),
            onPressed: () {
              _key.currentState?.openDrawer();
              // Scaffold.of(context).openDrawer();
            }),
      ),
      drawer: const SideBar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarouselWindow(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: videoCardData.length,
                        itemBuilder: (context, index) {
                          return videoCards(
                            imageUrl: "${videoCardData[index]['image']}",
                            name: "${videoCardData[index]['name']}",
                            subname: "${videoCardData[index]['subname']}",
                            hour: "${videoCardData[index]['hours']}",
                            mintes: "${videoCardData[index]['mintes']}",
                          );
                        }),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Categories",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subjectCardsBg.length,
                      itemBuilder: (context, index) {
                        return subjectcards(
                            imageurl: "${subjectCardsBg[index]['image']}",
                            name: "${subjectCardsBg[index]['name']}",
                            width: 154,
                            hegiht: 116);
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        "Popular Courses",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: popularcardData.length,
                        itemBuilder: (context, index) {
                          return poplurcards(
                              imageUrl: "${popularcardData[index]['image']}",
                              name: "${popularcardData[index]['name']}",
                              subname: "${popularcardData[index]['subname']}",
                              time: popularcardData[index]['time']);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
