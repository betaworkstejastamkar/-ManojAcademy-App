import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/widgets/drawer.dart';
import 'package:manojacademy/widgets/popularcards.dart';
import 'package:manojacademy/widgets/subjectcards.dart';
import 'package:manojacademy/widgets/videocards.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset('icons/bell.svg'),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Class 6'),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('icons/align-left.svg'),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
      ),
      drawer: const SideBar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: height - 650,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: imageDataItems.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(i));
                        },
                      );
                    }).toList(),
                  ),
                ),
                CarouselIndicator(
                  height: 10,
                  width: 10,
                  cornerRadius: 10,
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                  activeColor: const Color.fromRGBO(0, 129, 100, 1),
                  count: imageDataItems.length,
                  index: _current,
                ),
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
                              mintes: "${popularcardData[index]['mintes']}",
                              imageUrl: "${popularcardData[index]['image']}",
                              name: "${popularcardData[index]['name']}",
                              subname: "${popularcardData[index]['subname']}",
                              hour: "${popularcardData[index]['hours']}");
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
