import 'package:flutter/material.dart';
import 'package:manojacademy/screens/subScreens/videoscreen.dart';

Widget videoCards(
    {required String imageUrl,
    required String name,
    required String subname,
    required String hour,
    required String mintes}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const VideoScreen()),
        );
      },
      child: (Padding(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 150,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
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
      )),
    );
  });
}
