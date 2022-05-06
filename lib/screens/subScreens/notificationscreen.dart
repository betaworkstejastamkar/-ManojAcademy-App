import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List notificationData = [
  {
    'date': '23rd March,2022',
    'Data': [
      {
        'text': 'new New English subject video are avaliable',
        'time': '10:12',
        'status': true
      },
      {
        'text':
            'mike You have successfully completed history subject you can download the certificate.',
        'time': '17:20',
        'status': true
      },
    ]
  },
  {
    'date': '22nd March,2022 ',
    'Data': [
      {
        'text': 'New English subject video are avaliable',
        'time': '10:14',
        'status': true
      },
      {
        'text':
            'You have successfully completed history subject you can download the certificate.',
        'time': '14:12',
        'status': false
      },
    ]
  },
  {
    'date': '220nd March,2022 ',
    'Data': [
      {
        'text': 'New English subject video are avaliable',
        'time': '10:12',
        'status': false
      },
    ]
  }
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
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
              SvgPicture.asset('icons/bell.svg'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('Notification'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: notificationData.length,
          itemBuilder: (context, index) {
            return notificateDate(
                data: notificationData[index]['Data'],
                date: notificationData[index]['date']);
          },
        ),
      ),
    );
  }
}

Widget notificateDate({date, data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          date,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return notificationList(index: index, data: data);
          })
    ],
  );
}

Widget notificationList({index, data}) {
  List tempTime = data[index]['time'].split(":");
  int hour = int.parse(tempTime[0]);
  int min = int.parse(tempTime[1]);

  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
                left: BorderSide(
                    color: Color.fromRGBO(0, 129, 100, 1), width: 7)),
            color: data[index]['status']
                ? Colors.white
                : const Color.fromRGBO(236, 236, 236, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index]['text'],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Text(
                      "$hour:$min",
                      style: const TextStyle(
                          color: Color.fromRGBO(165, 153, 153, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
