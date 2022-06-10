import 'package:flutter/material.dart';

List popularcardData = [
  {
    'image': 'assets/bluebox.png',
    'subname': 'Science',
    'name': 'The Living Organisms and their Surrounding',
    'time': '1:24'
  },
  {
    'image': 'assets/greenbox.png',
    'subname': 'Science',
    'name': 'Weather and Climate',
    'time': '0:56'
  },
  {
    'image': 'assets/pinkbox.png',
    'subname': 'Geography',
    'name': 'The Living Organisms and their Surrounding',
    'time': '1:20'
  },
  {
    'image': 'assets/yellowbox.png',
    'subname': 'Science',
    'name': 'Weather and Climate',
    'time': '2:24'
  },
];
Widget poplurcards(
    {required String imageUrl,
    required String name,
    required String subname,
    required String time}) {
  late int hour, minte;
  List tempTime = time.split(":");
  minte = int.parse(tempTime[1]);
  hour = int.parse(tempTime[0]);

  return Builder(builder: (context) {
    return Card(
      child: (Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
                width: 95,
                height: 95,
                child: Image.asset(imageUrl, fit: BoxFit.fill)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subname,
                  style: const TextStyle(
                    color: Color.fromRGBO(165, 153, 153, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: Color.fromRGBO(165, 153, 153, 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${hour}h ${minte}m',
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
      )),
    );
  });
}
