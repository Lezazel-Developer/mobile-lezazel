import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lezazel_flutter/preferences/assets.dart';


List images = [
  MainAssets.carousel1,
  MainAssets.carousel2,
  MainAssets.carousel3
];

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: images
            .map(
              (image) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
            .toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: 170,// Adjust height as needed
          autoPlay: true, // Optional: if you want auto play
        ));
  }
}
