import 'package:flutter/material.dart';

List livelectrueData = [
  {
    'date': '26th April 2022',
    'time': '14:00pm',
    'name': 'Google meet',
    'link':
        'google+meet+app&oq=google+mee&aqs=chrome.3.69i59j69i57j0i433i512l2j0i131i433i512j0i433i512j0i512j69i60.5912j0j7&sourceid=chr',
    'icon': 'icons/googlemeet.png'
  },
  {
    'date': '24th April 2022',
    'time': '13:00pm',
    'name': 'Zoom',
    'link':
        'zoom+meet+app&oq=zoom+mee&aqs=zoom.3.69i59j69i57j0i433i512l2j0i131i433i512j0i433i512j0i512j69i60.5912j0j7&sourceid=chr',
    'icon': 'icons/zoom.png'
  },
];

class LivelecturesPage extends StatefulWidget {
  const LivelecturesPage({Key? key}) : super(key: key);

  @override
  State<LivelecturesPage> createState() => _LivelecturesPageState();
}

class _LivelecturesPageState extends State<LivelecturesPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            Image.asset('icons/link.png'),
            const SizedBox(
              width: 5,
            ),
            const Text('Live lectures'),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: height,
              child: ListView.builder(
                itemCount: livelectrueData.length,
                itemBuilder: (context, index) {
                  return liveLectureCard(
                    date: "${livelectrueData[index]['date']}",
                    time: "${livelectrueData[index]['time']}",
                    name: "${livelectrueData[index]['name']}",
                    link: "${livelectrueData[index]['link']}",
                    icon: "${livelectrueData[index]['icon']}",
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget liveLectureCard({date, time, name, link, icon}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      elevation: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                date,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                ',$time',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(icon),
              Text(
                ' $name',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          Text(
            link,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(102, 102, 217, 1)),
          )
        ],
      ),
    ),
  );
}
