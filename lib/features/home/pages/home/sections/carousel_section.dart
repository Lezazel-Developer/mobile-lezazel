import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/preferences/assets.dart';
import 'package:lezazel_flutter/thema.dart';

class CarouselHome extends StatefulWidget {
  CarouselHome({super.key});

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  final List images = [
    MainAssets.carousel1,
    MainAssets.carousel2,
    MainAssets.carousel3
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 25 : 7,
        height: 7,
        margin: const EdgeInsets.only(left: 2,right: 2, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ?
              Colors.grey: Colors.white,
        ),
      );
    }

    int index = -1;

    return Stack(
      children: [
        CarouselSlider(
          items: images.map((image) =>
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ).toList(),
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            height: 170,
            autoPlay: true,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              index++;
              return indicator(entry.key);
            }).toList(),
          ),
        )
      ],
    );
  }
}
