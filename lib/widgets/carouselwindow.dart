import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWindow extends StatefulWidget {
  final List data;
  const CarouselWindow({Key? key, required this.data}) : super(key: key);

  @override
  State<CarouselWindow> createState() => _CarouselWindowState();
}

class _CarouselWindowState extends State<CarouselWindow> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
          child: CarouselSlider(
            options: CarouselOptions(
                height: width < 440 ? height / 5 : height / 3,
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
            items: widget.data.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        i,
                        fit: BoxFit.contain,
                        width: width,
                      ));
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
          count: widget.data.length,
          index: _current,
        ),
      ],
    );
  }
}
