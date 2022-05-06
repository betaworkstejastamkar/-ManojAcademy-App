import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget testCard({index, name, question, precent}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
        borderRadius: BorderRadius.circular(10),
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
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  '$question Qestions',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                )
              ],
            ),
            const Spacer(),
            Text(
              '$precent%',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset('icons/arrow-right.svg'))
          ],
        ),
      ),
    ),
  );
}
