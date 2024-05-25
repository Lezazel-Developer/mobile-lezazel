import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lezazel_flutter/extensions/extensions.dart';
import 'package:lezazel_flutter/widget/widget.dart';
import 'sections/sections.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: ListView(
        children: [
          20.0.h,
          const Profile(),
          30.0.h,
          const CarouselHome(),
          30.0.h,
          const TitleHome(title: 'Popular Products'),
          10.0.h,
          const PopularProduct(),
          20.0.h,
          const TitleHome(title: 'All Products'),
          const Product(),
          30.0.h,
          // bottomAppbar(),
        ],
      ),
    );
  }
}


// SizedBox(height: 40),
// CategoryProduct(),
// SizedBox(height: 35),