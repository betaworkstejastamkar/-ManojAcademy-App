import 'package:flutter/material.dart';

List liveCardsData = [
  {
    'title': 'Chapter 6  - Operations on Vectors',
    'subject': 'Maths',
    'date': '28th April, 2022',
    'startTime': '3:00pm',
    'endTime': '4:00pm',
    'lecturer': 'Sheetal Rana Maam'
  },
  {
    'title': 'Chapter 8 - A Game of Chance',
    'subject': 'English',
    'date': '29th April, 2022',
    'startTime': '1:00pm',
    'endTime': '2:00pm',
    'lecturer': 'Jyostna Maam'
  },
];

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: height,
              child: ListView.builder(
                  itemCount: liveCardsData.length,
                  itemBuilder: (context, index) {
                    return liveCards(
                        title: '${liveCardsData[index]['title']}',
                        subject: '${liveCardsData[index]['subject']}',
                        date: '${liveCardsData[index]['date']}',
                        startTime: '${liveCardsData[index]['startTime']}',
                        endTime: '${liveCardsData[index]['endTime']}',
                        lecturer: '${liveCardsData[index]['lecturer']}',
                        width: width,
                        height: height);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget liveCards(
    {title, subject, date, startTime, endTime, lecturer, width, height}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Card(
            elevation: 0,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(5),
              child: Text(
                subject,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                'date: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                date,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Timing: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '$startTime - $endTime',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            width: width - 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Join'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(0, 129, 100, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
