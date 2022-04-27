import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

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
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 230.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
                    return Image.asset(i);
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
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 300,
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
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget videoCards(
    {required String imageUrl,
    required String name,
    required String subname,
    required String hour,
    required String mintes}) {
  return (Padding(
    padding: const EdgeInsets.all(10),
    child: Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200, width: 300, child: Image.asset(imageUrl)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.play_circle_fill,
                    size: 40, color: Color.fromRGBO(0, 129, 100, 1)),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Heebo'),
                    ),
                    Text(
                      subname,
                      style: const TextStyle(
                        color: Color.fromRGBO(165, 153, 153, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.alarm,
                          color: Color.fromRGBO(165, 153, 153, 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '${hour}h ${mintes}m',
                            style: const TextStyle(
                              color: Color.fromRGBO(165, 153, 153, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )
    ]),
  ));
}
